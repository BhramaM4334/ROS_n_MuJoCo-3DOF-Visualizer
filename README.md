<h1 align="center">
  For the codes is located at "codes" branch.
  <br>
  (GLFW and MuJoCo libraries are required)
</h1>


# Some explanation for the code
I'm using an entirely new arm file for this because the last one broke a bit. Also integrated ROS with MuJoCo
<br>
This is a project for ABINARA-1 Internship

## Simply, there are 2 nodes:
### 1. Publisher
Publisher being the thing where my inverse kinematics does it's things there

### 2. Subscriber
Subscriber being the listener and MuJoCo visualizer, and I made MuJoCo as a seperate header to tidy the code structures

### The reason why I use these 2 nodes:

Simply, because I want to loop it out, since I can just loop publisher so that subscriber can always listen to the publisher

## Preview video:
https://github.com/user-attachments/assets/18d43223-06ec-49b7-8066-fb79448303ba

## You can check the full breakdown of the code here: (Indonesian language)
https://drive.google.com/drive/folders/1KyS9h6J-JM7bznFwlRTzyiERicTu7Ysp?usp=sharing
