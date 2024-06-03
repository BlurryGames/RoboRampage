class_name AmmoHandler extends Node

enum AmmoType { BULLET = 0, SMALL_BULLET = 1 }

var ammo_storage: Dictionary = { AmmoType.BULLET: 10, AmmoType.SMALL_BULLET: 60 }

func has_ammo(type: AmmoType) -> bool:
	return ammo_storage[type] > 0

func use_ammo(type: AmmoType) -> void:
	if has_ammo(type):
		ammo_storage[type] -= 1
		print(ammo_storage[type])
