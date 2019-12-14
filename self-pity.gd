extends Node2D

var flyingBird = load("res://bird-flying-animation.tscn") as PackedScene
# var birdCount = 0
var birdCD = 0
var finished = false

const BIRD_COOLDOWN = 1.5
# const BIRD_MAX = 10


func _process(delta):
	if (finished && birdCD <= 0):
		add_bird()
	
	if (birdCD >= 0):
		birdCD -= delta



func add_bird():
	var f = flyingBird.instance()
	add_child(f)
	birdCD = BIRD_COOLDOWN * randf()