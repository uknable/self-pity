extends Node2D



const FLY_SPEED = 100
const FADE_SPEED = 0.1

var yPos

func _ready():
	# get_parent().birdCount += 1
	print("im in")
	randomize()
	yPos = randi() % 500 + 10
	self.modulate.a += randf()

	get_child(1).play("bird-left")
	
	self.position = Vector2(get_viewport_rect().size.x, yPos)

func _process(delta):
	self.position.x -= FLY_SPEED * delta
	self.modulate.a -= FADE_SPEED * delta

	if(self.modulate.a < 0):
		# get_parent().birdCount -= 1
		queue_free()
