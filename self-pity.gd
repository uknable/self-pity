extends Node2D

var finished = false
onready var flyingBird = load("res://bird-flying-animation.tscn") as PackedScene


func _ready():
	var f = flyingBird.instance()
	add_child(f)

