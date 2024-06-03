class_name Pickup extends Area3D

@export var amount: int = 20

@export var ammo_type: AmmoHandler.AmmoType = AmmoHandler.AmmoType.BULLET

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.ammo_handler.add_ammo(ammo_type, amount)
		queue_free()
