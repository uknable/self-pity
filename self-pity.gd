extends Node2D

var flyingBird = load("res://bird-flying-animation.tscn") as PackedScene
var bird_sound1 = load("res://sounds/bird_sound-001.wav")
var bird_sound2 = load("res://sounds/bird_sound-002.wav")
var bird_sound3 = load("res://sounds/bird_sound-003.wav")

var bird_sounds = [bird_sound1, bird_sound2, bird_sound3]

var birdCD = 0
var finished = false

const BIRD_COOLDOWN = 1.5



func _process(delta):
	if (finished && birdCD <= 0):
		add_bird()
		if (randi() % 10 <= 1 && !$BirdSounder.playing):
			$BirdSounder.stream = bird_sounds[randi() % bird_sounds.size()]
			# $BirdSounder.play()
	
	if (birdCD >= 0):
		birdCD -= delta



func add_bird():
	var f = flyingBird.instance()
	add_child(f)
	birdCD = BIRD_COOLDOWN * randf()