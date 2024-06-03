class_name AmmoHandler extends Node

enum AmmoType { BULLET = 0, SMALL_BULLET = 1 }

@export var ammo_label: Label = null

var ammo_storage: Dictionary = { AmmoType.BULLET: 10, AmmoType.SMALL_BULLET: 60 }

func has_ammo(type: AmmoType) -> bool:
	return ammo_storage[type] > 0

func use_ammo(type: AmmoType) -> void:
	if has_ammo(type):
		ammo_storage[type] -= 1
		update_ammo_label(type)

func update_ammo_label(type: AmmoType) -> void:
	ammo_label.text = str(ammo_storage[type])
