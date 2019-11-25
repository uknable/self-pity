extends Button

var down = false

func _ready():
	connect("button_down", self, "_on_WordButton_button_down")
	connect("button_up", self, "_on_WordButton_button_up")

func _process(delta):
	if (down && Input.is_action_pressed("left_mouse")):
		self.set_position(get_viewport().get_mouse_position())

func _on_WordButton_button_down():
	down = true
	print(down)

func _on_WordButton_button_up():
	down = false
	print(down)

	# if self.index is next to a button that is of one index difference:
	# 	append this name to the leftmost indexed button 
	# 	delete this button
