#ifndef MUJOCO_VISUAL_H
#define MUJOCO_VISUAL_H

#include <mujoco/mujoco.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include <vector>
#include <string>

//we are using a .h C file and not a CPP

using namespace std;

class MujocoViewer {
  
  private:	
    mjModel* m;
    mjData* d;
    GLFWwindow* window;	//glfw window pointer's name is window
    vector<double> target_ctrl;

    mjvCamera cam;
    mjvOption opt;
    mjvScene scn;
    mjrContext con;

//inline because the one who uses this header needs these
    static inline bool button_left = false;
    static inline bool button_middle = false;
    static inline bool button_right = false;
    static inline double lastx = 0.0;
    static inline double lasty = 0.0;

    static void mouse_button(GLFWwindow* window, int button, int action, int mods) {
        button_left = (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT) == GLFW_PRESS);
        button_right = (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_RIGHT) == GLFW_PRESS);
        button_middle = (glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_MIDDLE) == GLFW_PRESS);
        glfwGetCursorPos(window, &lastx, &lasty);
    }

    static void mouse_move(GLFWwindow* window, double xpos, double ypos) {
        if (!button_left && !button_right && !button_middle) return;
        
    //check viewer, this exists because of c thing i guess
        MujocoViewer* viewer = static_cast<MujocoViewer*>(glfwGetWindowUserPointer(window));
        if (!viewer) return;

        double dx = xpos - lastx;
        double dy = ypos - lasty;
        lastx = xpos;
        lasty = ypos;

        int width, height;
        glfwGetWindowSize(window, &width, &height);

// the modern mujoco api has V on the rotate and move
        mjtMouse action = mjMOUSE_NONE;
        if (button_left) action = mjMOUSE_ROTATE_V; // Updated for modern MuJoCo API
        else if (button_right) action = mjMOUSE_MOVE_V; // Updated for modern MuJoCo API
        else if (button_middle) action = mjMOUSE_ZOOM;
// void mjv_moveCamera(const mjModel* m, int action, mjtNum reldx, mjtNum reldy, mjvCamera* cam);
        mjv_moveCamera(viewer->m, action, dx / height, dy / height, &viewer->scn, &viewer->cam);
    }

    static void scroll(GLFWwindow* window, double xoffset, double yoffset) {
        MujocoViewer* viewer = static_cast<MujocoViewer*>(glfwGetWindowUserPointer(window));
        if (!viewer) return;
        mjv_moveCamera(viewer->m, mjMOUSE_ZOOM, 0, -0.05 * yoffset, &viewer->scn, &viewer->cam);
    }

public:
    MujocoViewer(const std::string& xml_path) {
        char error[1000];
        m = mj_loadXML(xml_path.c_str(), NULL, error, 1000);
        if (!m) {
            std::cerr << "Load model error: " << error << std::endl;
            exit(-1);
        }
        d = mj_makeData(m); // Updated from mj_data(m) to mj_makeData(m)
        target_ctrl.resize(m->nu, 0.0);

        if (!glfwInit()) {
            std::cerr << "Could not initialize GLFW" << std::endl;
            exit(-1);
        }

        window = glfwCreateWindow(1200, 900, "Visuals", NULL, NULL);
        if (!window) {
            glfwTerminate();
            exit(-1);
        }
        
        glfwMakeContextCurrent(window);
        glfwSwapInterval(0);
        glfwSetWindowUserPointer(window, this);

        mjv_defaultCamera(&cam);
        mjv_defaultOption(&opt);
        mjv_defaultScene(&scn);
        mjr_defaultContext(&con);

        mjv_makeScene(m, &scn, 2000);
        mjr_makeContext(m, &con, mjFONTSCALE_150);

        glfwSetMouseButtonCallback(window, mouse_button);
        glfwSetCursorPosCallback(window, mouse_move);
        glfwSetScrollCallback(window, scroll);
    }

    ~MujocoViewer() {
        mjv_freeScene(&scn);
        mjr_freeContext(&con);
        glfwDestroyWindow(window);
        glfwTerminate();
        mj_deleteData(d);
        mj_deleteModel(m);
    }

    bool shouldClose() {	//if should close, then should close
        return glfwWindowShouldClose(window);
    }

    void setControl(int index, double value) {
        if (m && index >= 0 && index < m->nu) {
            target_ctrl[index] = value;
        }
    }

    void renderStep() {
    	//step render, viewer needs this
        if (!m || !d) return;

        for (int i = 0; i < m->nu; ++i) {
            d->ctrl[i] = target_ctrl[i];
        }

        mj_step(m, d);

        mjrRect viewport = {0, 0, 0, 0};
        glfwGetFramebufferSize(window, &viewport.width, &viewport.height);

        mjv_updateScene(m, d, &opt, NULL, &cam, mjCAT_ALL, &scn);
        mjr_render(viewport, &scn, &con);

        glfwSwapBuffers(window);
        glfwPollEvents();
    }
};

#endif
