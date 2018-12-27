extends Area2D

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if get_node("BulletTimer").is_stopped():
			fire_bullet()
			get_node("BulletTimer").start()


func fire_bullet():
	var target = Vector2();
	target.x = get_viewport().get_mouse_position().x - position.x
	target.y = get_viewport().get_mouse_position().y - position.y
	get_node("/root/Main/Bullet_Master").fire_bullet(position, target)