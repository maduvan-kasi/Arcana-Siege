extends Node

var player
var map
var speed = 500

var s_width = OS.window_size.x
var s_height = OS.window_size.y

func _ready():
	player = get_node("/root/Main/Player")
	map = get_node("/root/Main/Map")
	pass


func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if velocity != Vector2():
		player.get_node("AnimatedSprite").play()
		velocity = velocity.normalized() * speed * delta

		if is_screen_scrollable(velocity, "y"):
			map.position.y -= velocity.y
		else:
			player.position.y = clamp(player.position.y + velocity.y, 0, s_height)

		if is_screen_scrollable(velocity, "x"):
			map.position.x -= velocity.x
		else:
			player.position.x = clamp(player.position.x + velocity.x, 0, s_width)

	else:
		player.get_node("AnimatedSprite").frame = 0
		player.get_node("AnimatedSprite").stop()


func is_screen_scrollable(velocity, axis):
	if axis == "x":
		var width = map.texture.get_width()
		if abs(player.position.x - s_width/2) < 5:
			if velocity.x > 0:
				return map.position.x + width / 2 - velocity.x > s_width
			else:
				return map.position.x - width / 2 - velocity.x < 0
	elif axis == "y":
		var height = map.texture.get_height()
		if abs(player.position.y - s_height/2) < 5:
			if velocity.y > 0:
				return map.position.y + height / 2 - velocity.y > s_height
			else:
				return map.position.y - height / 2 - velocity.y < 0