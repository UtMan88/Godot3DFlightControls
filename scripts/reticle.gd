class_name Reticle
extends Control

@export var aim_at_object:Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var pos = aim_at_object.global_position
	var cam = get_tree().root.get_camera_3d()
	var screenPos = cam.unproject_position(pos)
	global_position = screenPos
