extends Node

var cards
var card_count
var card_list
var i

func _ready():
	cards = get_children()
	card_count = len(cards)
	
	var file = File.new()
	file.open("res://deck.txt", file.READ)
	var content = file.get_as_text()
	file.close()
	card_list = content.split("\n")
	i = 2
	
func _process(delta):
	if Input.is_action_pressed("cycle_forward"):
		if get_node("Timer").is_stopped():
			cards[0].set_texture(load("res://Assests/Cards/" + card_list[i-2] + ".png"))
			cards[1].set_texture(load("res://Assests/Cards/" + card_list[i-1] + ".png"))
			cards[2].set_texture(load("res://Assests/Cards/" + card_list[i] + ".png"))
			i += 1
			get_node("Timer").start()