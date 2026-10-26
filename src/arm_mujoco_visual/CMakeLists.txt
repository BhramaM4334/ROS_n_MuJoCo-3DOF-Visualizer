cmake_minimum_required(VERSION 3.0.2)
project(arm_mujoco_visual)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  message_generation
  roslib
)

## Declare custom messages in the msg/ folder
add_message_files(
  FILES
  TriangleCmd.msg
)

## Generate added messages and services
generate_messages(
  DEPENDENCIES
  std_msgs
)

## Declare catkin package dependencies and exported include dirs
catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS roscpp std_msgs message_runtime
)

## Find system libraries (GLFW and OpenGL)
find_package(PkgConfig REQUIRED)
pkg_check_modules(GLFW3 REQUIRED glfw3)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${GLFW3_INCLUDE_DIRS}
)

## 1. Triangle Trajectory Publisher Executable
add_executable(publisher_node src/publisher.cpp)
target_link_libraries(publisher_node
  ${catkin_LIBRARIES}
)
add_dependencies(publisher_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## 2. MuJoCo Viewer Executable
add_executable(mujoco_viewer_node src/subscriber.cpp)

target_link_libraries(mujoco_viewer_node
  ${catkin_LIBRARIES}
  mujoco
  ${GLFW3_LIBRARIES}
  GL
)
add_dependencies(mujoco_viewer_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})