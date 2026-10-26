;; Auto-generated. Do not edit!


(when (boundp 'arm_mujoco_visual::TriangleCmd)
  (if (not (find-package "ARM_MUJOCO_VISUAL"))
    (make-package "ARM_MUJOCO_VISUAL"))
  (shadow 'TriangleCmd (find-package "ARM_MUJOCO_VISUAL")))
(unless (find-package "ARM_MUJOCO_VISUAL::TRIANGLECMD")
  (make-package "ARM_MUJOCO_VISUAL::TRIANGLECMD"))

(in-package "ROS")
;;//! \htmlinclude TriangleCmd.msg.html


(defclass arm_mujoco_visual::TriangleCmd
  :super ros::object
  :slots (_shoulder_rotate _base_pitch _elbow_joint _magnet_joint ))

(defmethod arm_mujoco_visual::TriangleCmd
  (:init
   (&key
    ((:shoulder_rotate __shoulder_rotate) 0.0)
    ((:base_pitch __base_pitch) 0.0)
    ((:elbow_joint __elbow_joint) 0.0)
    ((:magnet_joint __magnet_joint) 0.0)
    )
   (send-super :init)
   (setq _shoulder_rotate (float __shoulder_rotate))
   (setq _base_pitch (float __base_pitch))
   (setq _elbow_joint (float __elbow_joint))
   (setq _magnet_joint (float __magnet_joint))
   self)
  (:shoulder_rotate
   (&optional __shoulder_rotate)
   (if __shoulder_rotate (setq _shoulder_rotate __shoulder_rotate)) _shoulder_rotate)
  (:base_pitch
   (&optional __base_pitch)
   (if __base_pitch (setq _base_pitch __base_pitch)) _base_pitch)
  (:elbow_joint
   (&optional __elbow_joint)
   (if __elbow_joint (setq _elbow_joint __elbow_joint)) _elbow_joint)
  (:magnet_joint
   (&optional __magnet_joint)
   (if __magnet_joint (setq _magnet_joint __magnet_joint)) _magnet_joint)
  (:serialization-length
   ()
   (+
    ;; float64 _shoulder_rotate
    8
    ;; float64 _base_pitch
    8
    ;; float64 _elbow_joint
    8
    ;; float64 _magnet_joint
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _shoulder_rotate
       (sys::poke _shoulder_rotate (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _base_pitch
       (sys::poke _base_pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _elbow_joint
       (sys::poke _elbow_joint (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _magnet_joint
       (sys::poke _magnet_joint (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _shoulder_rotate
     (setq _shoulder_rotate (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _base_pitch
     (setq _base_pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _elbow_joint
     (setq _elbow_joint (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _magnet_joint
     (setq _magnet_joint (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get arm_mujoco_visual::TriangleCmd :md5sum-) "63410d8db2333733f37e653e6f337986")
(setf (get arm_mujoco_visual::TriangleCmd :datatype-) "arm_mujoco_visual/TriangleCmd")
(setf (get arm_mujoco_visual::TriangleCmd :definition-)
      "float64 shoulder_rotate
float64 base_pitch
float64 elbow_joint
float64 magnet_joint

")



(provide :arm_mujoco_visual/TriangleCmd "63410d8db2333733f37e653e6f337986")


