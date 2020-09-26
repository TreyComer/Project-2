extends KinematicBody2D

export var speed = 4
export var rotation_speed = 0.1

onready var Bullet = load("res://Bullet/Bullet.tscn")

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	var mouse = get_local_mouse_position()
	rotation += mouse.angle()*rotation_speed
	position += get_input()*speed
	
	if Input.is_action_pressed("shoot"):
		var bullet =  Bullet.instance()
		bullet.position = position
		get_node("/root/Game/Bullets").add_child(bullet)

func get_input():
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("up"):
		input_dir.y -= 1
	if Input.is_action_pressed("down"):
		input_dir.y += 1
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	return input_dir.rotated(rotation)
