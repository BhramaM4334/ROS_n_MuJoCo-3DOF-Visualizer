#include <iostream>
#include <vector>
#include <cmath>
#include "ros/ros.h"
#include <arm_mujoco_visual/TriangleCmd.h>

//i decided to put the code with publisher as one, maybe i can do the lerp at publisher but idk i guess why not be it as one for now, the mujoco should be different

using namespace std;


//since this construct is crucial, i don't know how to translate it for cross header, i'll leave this for now. maybe ill update later

struct _3Points{
	double x,y,z; //x y z points
};

class ComputeIK{	//compute inverse kinematics
	
	private:
	//ros stuff
		ros::NodeHandle nh;
    	ros::Publisher joint_pub;
    	ros::Timer timer;
    	
	//calc variables
		double shoulder = 0.5, elbow = 0.4; //input in meters (following the arm.xml and urdf
		vector<_3Points> tetha; //tetha list, should return 3 for now
		vector<_3Points> original;	
		vector<_3Points> tetha_lerp;
	//for sizing
		size_t current_index;

//inverse kinemtics
		void InverseKinematic(vector<_3Points> XYZPoints){
		for(int i=0;i<XYZPoints.size();i++){
			_3Points point = XYZPoints[i];
			original.push_back(point);
				
			double tetha1,tetha2,tetha3;
			double r = sqrt(point.x*point.x + point.y*point.y);		//range (x and y plane)
			double d = sqrt(r*r + point.z*point.z);					//range (using Z plane)
			
			//tetha 1 calc (base yaw)
			tetha1 = atan2(point.y , point.x); 	//X^2 + Y^2 -> tetha 1 is for base yawing, so use X and Y planes || arctan2(Y/X)
			
			//tetha2 || alpha -> degree from bottom to mid ; beta -> degree from mid to the up (for the compensation so that the elbow can move
			double alpha = atan2(point.z,r);
			
			double cos_tetha2 = (pow(shoulder,2) + pow(d,2) - pow(elbow,2)) / (2 * shoulder * d);
			double beta = acos(cos_tetha2);
			
			//insert tetha2;
			tetha2 = alpha+beta;
			
			//tetha3
			double cos_tetha3 = (shoulder*shoulder + elbow*elbow - d*d) / (2 * shoulder * elbow);
			tetha3 = acos(cos_tetha3);
			
			//input to tetha vector tetha
			_3Points t = {tetha1,tetha2,tetha3};
			
			tetha.push_back(t);
			
		}
	//run the lerp after running IK
	  DivideHZ(tetha);
	}	
	
//robot positions
		void PrintRobotPositions(){
			cout<<endl<<"The degrees of for desired poimts: \n\n";
			for(int i=0;i<tetha.size();i++){
				cout<<"Points (x,y,z) ["<<i<<"]: ";
				cout<<original[i].x<<" "<<original[i].y<<" "<<original[i].z<<endl<<endl;
				
				cout<<"Degrees needed:\n";
				//base
				cout<<"Base Yawing: "<<tetha[i].x<<endl;
				cout<<"Shoulder Joint (Alpha + Beta): "<<tetha[i].y<<endl;
				cout<<"Elbow Joint: "<<tetha[i].z<<endl<<endl;
			}
		cout<<endl<<endl<<"Lerp'd positions (100Hz): \n\n";
		for(int i =0;i<tetha_lerp.size();i++){
			cout<<"["<<i+1<<"] "<<tetha_lerp[i].x <<" "<<tetha_lerp[i].y<<" "<<tetha_lerp[i].z<<endl;
			}
		}

//lets say, 100 hz, since its still 3 joints, i think I will have to limit this to 3 first, i don't know how yet to dynamically do this
void DivideHZ(vector<_3Points> inp) {
    tetha_lerp.clear();
    if (inp.empty()) return;

    int num_segments = inp.size();
    
    for(int i = 0; i < num_segments; i++) {
        _3Points start = inp[i];
        _3Points endd = (i + 1 == num_segments) ? inp[0] : inp[i + 1];
        
        // Start at j = 0 so the first point is exactly the start vertex (t = 0.0)
        for(double j = 0; j <= 100; j++) {
            _3Points temp;
            
            temp.x = (endd.x - start.x) * t;
            temp.y = (endd.y - start.y) * t;
            temp.z = (endd.z - start.z) * t;
            
            tetha_lerp.push_back(temp);
        }
    }
}	
//some callback init
	void callbackLoop(const ros::TimerEvent& event){
	//define point as that
		_3Points point = tetha_lerp[current_index];
		
		if (tetha_lerp.empty()) return;

        if (current_index >= tetha_lerp.size()) {	//if the loop exceeds, just go again
            current_index = 0;
        }
		
	//	cout<<point.x<<" "<<point.y<<" "<<point.z<<endl;
		
		
        arm_mujoco_visual::TriangleCmd msg;
        //xyz => base, shoulder, elbow
        msg.shoulder_rotate = point.x;
        msg.base_pitch 		= point.y;
        msg.elbow_joint 	= point.z;
        msg.magnet_joint 	= 0.0;


        joint_pub.publish(msg);
        current_index++;
		//keep publishing and keep indexing || msg is from ros/ros.h
			
		}
	
	public:
		
		//set points, triangular || you can change the triangular points here, I'm a little lazy to rewrite the code so that it does the thing
		_3Points pointA = {0.30, 0.0, 0.25};
		_3Points pointB = {0.35, 0.10, 0.25};
		_3Points pointC = {0.35, -0.10, 0.25};
		
		vector<_3Points> ABC = {pointA, pointB, pointC}; 
		
		ComputeIK() : current_index(0){
			//publish here
			joint_pub = nh.advertise<arm_mujoco_visual::TriangleCmd>("ThreeDOF_JointCommands", 10);
			InverseKinematic(ABC);
			PrintRobotPositions();
			//do the timer thing here
			cout<<"Publishing info to ROS...\n";
		//create callback
			timer = nh.createTimer(ros::Duration(0.01), &ComputeIK::callbackLoop, this);
		}
		
	// inverse kinematics
		
	
	
};

int main(int argc, char **argv) {
    ros::init(argc, argv, "triangle_publisher_node");
    ComputeIK Compute;
    ros::spin();
    return 0;
}
