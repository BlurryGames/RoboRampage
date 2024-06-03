class_name WeaponHandler extends Node3D

@export var weapon_1: HitscanWeapon = null
@export var weapon_2: HitscanWeapon = null

func _ready() -> void:
	equip(weapon_2)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("weapon_1"):
		equip(weapon_1)
	
	if event.is_action_pressed("weapon_2"):
		equip(weapon_2)

func equip(active_weapon: HitscanWeapon) -> void:
	for c: HitscanWeapon in get_children():
		if c == active_weapon:
			c.visible = true
			c.set_process(true)
		else:
			c.visible = false
			c.set_process(false)
