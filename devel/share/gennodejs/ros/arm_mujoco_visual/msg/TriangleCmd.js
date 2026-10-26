// Auto-generated. Do not edit!

// (in-package arm_mujoco_visual.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TriangleCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.shoulder_rotate = null;
      this.base_pitch = null;
      this.elbow_joint = null;
      this.magnet_joint = null;
    }
    else {
      if (initObj.hasOwnProperty('shoulder_rotate')) {
        this.shoulder_rotate = initObj.shoulder_rotate
      }
      else {
        this.shoulder_rotate = 0.0;
      }
      if (initObj.hasOwnProperty('base_pitch')) {
        this.base_pitch = initObj.base_pitch
      }
      else {
        this.base_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('elbow_joint')) {
        this.elbow_joint = initObj.elbow_joint
      }
      else {
        this.elbow_joint = 0.0;
      }
      if (initObj.hasOwnProperty('magnet_joint')) {
        this.magnet_joint = initObj.magnet_joint
      }
      else {
        this.magnet_joint = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TriangleCmd
    // Serialize message field [shoulder_rotate]
    bufferOffset = _serializer.float64(obj.shoulder_rotate, buffer, bufferOffset);
    // Serialize message field [base_pitch]
    bufferOffset = _serializer.float64(obj.base_pitch, buffer, bufferOffset);
    // Serialize message field [elbow_joint]
    bufferOffset = _serializer.float64(obj.elbow_joint, buffer, bufferOffset);
    // Serialize message field [magnet_joint]
    bufferOffset = _serializer.float64(obj.magnet_joint, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TriangleCmd
    let len;
    let data = new TriangleCmd(null);
    // Deserialize message field [shoulder_rotate]
    data.shoulder_rotate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [base_pitch]
    data.base_pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [elbow_joint]
    data.elbow_joint = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [magnet_joint]
    data.magnet_joint = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'arm_mujoco_visual/TriangleCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '63410d8db2333733f37e653e6f337986';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 shoulder_rotate
    float64 base_pitch
    float64 elbow_joint
    float64 magnet_joint
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TriangleCmd(null);
    if (msg.shoulder_rotate !== undefined) {
      resolved.shoulder_rotate = msg.shoulder_rotate;
    }
    else {
      resolved.shoulder_rotate = 0.0
    }

    if (msg.base_pitch !== undefined) {
      resolved.base_pitch = msg.base_pitch;
    }
    else {
      resolved.base_pitch = 0.0
    }

    if (msg.elbow_joint !== undefined) {
      resolved.elbow_joint = msg.elbow_joint;
    }
    else {
      resolved.elbow_joint = 0.0
    }

    if (msg.magnet_joint !== undefined) {
      resolved.magnet_joint = msg.magnet_joint;
    }
    else {
      resolved.magnet_joint = 0.0
    }

    return resolved;
    }
};

module.exports = TriangleCmd;
