class_name MathLib
extends Node

# Source: https://gist.github.com/johnsoncodehk/2ecb0136304d4badbb92bd0c1dbd8bae
static func clamp_angle(angle:float, min:float, max:float) -> float:
	var start:float = (min + max) * 0.5 - 180
	var floorVal:float = floori((angle - start) / 360) * 360
	min += floorVal
	max += floorVal
	return clampf(angle, min, max)


static func smooth_look_at(from:Node3D, target:Node3D, damp:float, delta:float) -> Quaternion:
	var look = target.global_transform.looking_at(from.position, Vector3.UP)
	return from.quaternion.slerp(Quaternion.from_euler(look.basis.get_euler()), damp * delta)
