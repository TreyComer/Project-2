extends KinematicBody2D

onready var HUD = get_node("/root/Game/HUD")
onready var Enemy = load("res://Enemy/Enemy.tscn")

export var speed = Vector2(0,3)
export var health = 100
export var points = 10
export var damage = 50

onready var Explosion = load("res://Explosion/Explosion.tscn")


func _physics_process(_delta):
	position += speed

	if position.y > get_viewport().size.y + 100:
		queue_free()

func die():
	HUD.update_score(points)
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	explosion.get_node("Animation").play()
	queue_free()