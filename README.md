# !! For the source codes, please go to the "codes" branch !! <br>&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;!! (GLFW and MuJoCo library required) !!
<br><br>
# Some explanation for the code
I'm using an entirely new arm file for this because the last one broke a bit. Also integrated ROS with MuJoCo


## Simply, there are 2 nodes:
### 1. Publisher
Publisher being the thing where my inverse kinematics does it's things there

### 2. Subscriber
Subscriber being the listener and MuJoCo visualizer, and I made MuJoCo as a seperate header to tidy the code structures

### The reason why I use these 2 nodes:

Simply, because I want to loop it out, since I can just loop publisher so that subscriber can always listen to the publisher

## Preview video:
https://github.com/user-attachments/assets/18d43223-06ec-49b7-8066-fb79448303ba




