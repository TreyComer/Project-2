extends KinematicBody2D

export var speed = Vector2(0,-10)
onready var Explosion = load("res://Explosion/Explosion.tscn")

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	position += speed
	
	if global_position.y < -100:
		queue_free()

func _on_Area2D_body_entered(body):
	body.queue_free()
	var explosion = Explosion.instance()
	
	queue_free()
