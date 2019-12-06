extends Node2D

const FLY_SPEED = 100
const FADE_SPEED = 0.1
# const SCALE_SPEED = 0.1

var yPos

func _ready():
	randomize()
	yPos = randi() % 160 + 240
	get_child(1).play("bird-left")
	
	self.position = Vector2(get_viewport_rect().size.x, yPos)

func _process(delta):
	self.position.x -= FLY_SPEED * delta
	self.modulate.a -= FADE_SPEED * delta
	# self.scale -= Vector2(SCALE_SPEED, SCALE_SPEED) * delta