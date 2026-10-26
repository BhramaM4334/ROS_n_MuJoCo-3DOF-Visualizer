#include <ros/ros.h>
#include <ros/package.h>
#include <arm_mujoco_visual/TriangleCmd.h>
#include <arm_mujoco_visual/mujoco_visual.h>

using namespace std;

MujocoViewer* viewer_ptr = nullptr;

void jointCommandCallback(const arm_mujoco_visual::TriangleCmd::ConstPtr& msg) {
    if (viewer_ptr == nullptr) return;
    //debug here
   // ROS_INFO("Received - Pitch: %f, Elbow: %f", msg->base_pitch, msg->elbow_joint);
    viewer_ptr->setControl(0, msg->shoulder_rotate);
    viewer_ptr->setControl(1, msg->base_pitch);
    viewer_ptr->setControl(2, msg->elbow_joint);
    viewer_ptr->setControl(3, msg->magnet_joint);
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "mujoco_viewer_node");
    ros::NodeHandle nh;

//use this for dynamic
    string package_path = ros::package::getPath("arm_mujoco_visual");
    string xml_path = package_path + "/arm.xml";
    
    MujocoViewer viewer(xml_path);    
    viewer_ptr = &viewer;

    ros::Subscriber sub = nh.subscribe("ThreeDOF_JointCommands", 10, jointCommandCallback);
    ROS_INFO("viewer node start\n");

    while (ros::ok() && !viewer.shouldClose()) {
        ros::spinOnce();        
        viewer.renderStep();    //viewer usees void renderstep()
    }

    return 0;
}
