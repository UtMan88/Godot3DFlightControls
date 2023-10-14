#############
# Simple SmoothFollow Script
#############
class_name SmoothFollow
extends Node3D

# Target we are following
@export var target:Node3D
# The distance in the x-z plane to the target
@export var distance:float = 10.0
# the height we want the camera to be above the target
@export var height:float = 5.0
# Smooth the follow by damping it
@export var position_damping:float = 2.0
# Should we also look at the target?
@export var should_rotate:bool = true
#Smooth the rotation by damping it
@export var rotation_damping:float = 3.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(target):
		_follow(delta)


func _follow(delta):
	# Set the position of the camera on the x-z plane to:
	#	distance meters behind the target
	var offset = -target.global_transform.basis.z * distance
	var desired_position = target.position + offset
	#   Set the height of the camera
	desired_position.y += height
	#   Lerp the final value
	set_position(lerp(get_position(), desired_position, position_damping * delta))
	#   Always look at the target
	if (should_rotate == true):
		self.quaternion = MathLib.smooth_look_at(self, target, rotation_damping, delta)
