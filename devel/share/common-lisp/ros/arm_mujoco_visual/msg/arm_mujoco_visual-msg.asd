
(cl:in-package :asdf)

(defsystem "arm_mujoco_visual-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TriangleCmd" :depends-on ("_package_TriangleCmd"))
    (:file "_package_TriangleCmd" :depends-on ("_package"))
  ))