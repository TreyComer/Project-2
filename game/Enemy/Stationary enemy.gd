extends KinematicBody2D

export var shoot_probability = 0.2

onready var HUD = get_node("/root/Game/HUD")

export var health = 200
export var points = 100

onready var Bullet = load("res://Bullet/Bullet2.tscn")
onready var Explosion = load("res://Explosion/Explosion.tscn")

func _ready():
	randomize()

func shoot():
	var bullet = Bullet.instance()
	bullet.position = position
	get_node("root/Game/Bullets").add_child(bullet)
	

func _on_shoot_timeout():
	if randf() < shoot_probability:
		shoot()

func die():
	HUD.update_score(points)
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	explosion.get_node("Animation").play()
	queue_free()
