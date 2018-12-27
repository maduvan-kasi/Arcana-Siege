extends Node

var Bullet = load("res://Bullet.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func fire_bullet(start, target):
	var bullet = Bullet.instance()
	bullet.position = start
	bullet.direction = target.angle_to(Vector2(1, 0))
	add_child(bullet)
