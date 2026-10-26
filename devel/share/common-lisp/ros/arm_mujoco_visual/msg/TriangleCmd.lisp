; Auto-generated. Do not edit!


(cl:in-package arm_mujoco_visual-msg)


;//! \htmlinclude TriangleCmd.msg.html

(cl:defclass <TriangleCmd> (roslisp-msg-protocol:ros-message)
  ((shoulder_rotate
    :reader shoulder_rotate
    :initarg :shoulder_rotate
    :type cl:float
    :initform 0.0)
   (base_pitch
    :reader base_pitch
    :initarg :base_pitch
    :type cl:float
    :initform 0.0)
   (elbow_joint
    :reader elbow_joint
    :initarg :elbow_joint
    :type cl:float
    :initform 0.0)
   (magnet_joint
    :reader magnet_joint
    :initarg :magnet_joint
    :type cl:float
    :initform 0.0))
)

(cl:defclass TriangleCmd (<TriangleCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TriangleCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TriangleCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arm_mujoco_visual-msg:<TriangleCmd> is deprecated: use arm_mujoco_visual-msg:TriangleCmd instead.")))

(cl:ensure-generic-function 'shoulder_rotate-val :lambda-list '(m))
(cl:defmethod shoulder_rotate-val ((m <TriangleCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_mujoco_visual-msg:shoulder_rotate-val is deprecated.  Use arm_mujoco_visual-msg:shoulder_rotate instead.")
  (shoulder_rotate m))

(cl:ensure-generic-function 'base_pitch-val :lambda-list '(m))
(cl:defmethod base_pitch-val ((m <TriangleCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_mujoco_visual-msg:base_pitch-val is deprecated.  Use arm_mujoco_visual-msg:base_pitch instead.")
  (base_pitch m))

(cl:ensure-generic-function 'elbow_joint-val :lambda-list '(m))
(cl:defmethod elbow_joint-val ((m <TriangleCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_mujoco_visual-msg:elbow_joint-val is deprecated.  Use arm_mujoco_visual-msg:elbow_joint instead.")
  (elbow_joint m))

(cl:ensure-generic-function 'magnet_joint-val :lambda-list '(m))
(cl:defmethod magnet_joint-val ((m <TriangleCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_mujoco_visual-msg:magnet_joint-val is deprecated.  Use arm_mujoco_visual-msg:magnet_joint instead.")
  (magnet_joint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TriangleCmd>) ostream)
  "Serializes a message object of type '<TriangleCmd>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'shoulder_rotate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'base_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'elbow_joint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'magnet_joint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TriangleCmd>) istream)
  "Deserializes a message object of type '<TriangleCmd>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'shoulder_rotate) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'base_pitch) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elbow_joint) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'magnet_joint) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TriangleCmd>)))
  "Returns string type for a message object of type '<TriangleCmd>"
  "arm_mujoco_visual/TriangleCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TriangleCmd)))
  "Returns string type for a message object of type 'TriangleCmd"
  "arm_mujoco_visual/TriangleCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TriangleCmd>)))
  "Returns md5sum for a message object of type '<TriangleCmd>"
  "63410d8db2333733f37e653e6f337986")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TriangleCmd)))
  "Returns md5sum for a message object of type 'TriangleCmd"
  "63410d8db2333733f37e653e6f337986")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TriangleCmd>)))
  "Returns full string definition for message of type '<TriangleCmd>"
  (cl:format cl:nil "float64 shoulder_rotate~%float64 base_pitch~%float64 elbow_joint~%float64 magnet_joint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TriangleCmd)))
  "Returns full string definition for message of type 'TriangleCmd"
  (cl:format cl:nil "float64 shoulder_rotate~%float64 base_pitch~%float64 elbow_joint~%float64 magnet_joint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TriangleCmd>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TriangleCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'TriangleCmd
    (cl:cons ':shoulder_rotate (shoulder_rotate msg))
    (cl:cons ':base_pitch (base_pitch msg))
    (cl:cons ':elbow_joint (elbow_joint msg))
    (cl:cons ':magnet_joint (magnet_joint msg))
))
