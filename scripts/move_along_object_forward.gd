class_name MoveAlongObjectForward
extends Node3D

@export var target:Node3D
@export var local_space:bool = false
@export var speed:float = 6.0


func smooth_rotation(to_rotation:Vector3, duration:float):
	transform.basis = Basis.from_euler(to_rotation)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(target):
		var forward:Vector3 = Vector3.FORWARD
		if (local_space == false) :
			forward = target.global_transform.basis.z
		else:
			forward = target.transform.basis.z
		global_translate((forward * speed) * delta)
