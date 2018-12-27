extends Area2D

export (int) var direction
var speed = 1000
var s_width = OS.window_size.x
var s_height = OS.window_size.y
var width
var height

func _ready():
	width = get_node("CollisionShape2D").shape.extents.x
	height = get_node("CollisionShape2D").shape.extents.y

func _process(delta):
	position.x += cos(direction) * speed * delta
	position.y -= sin(direction) * speed * delta
	
	if (position.x - width / 2 > s_width or position.x + width / 2 < 0
		or position.y - height / 2 > s_height or position.y + height / 2 < 0):
		queue_free()