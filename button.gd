extends Button

var down = false
var size
var button_rect
const SNAP_RADIUS = 10

func _ready():
	connect("button_down", self, "_on_WordButton_button_down")
	connect("button_up", self, "_on_WordButton_button_up")

	size = self.get_size()

	$ButtonArea.set_position(size/2)

	button_rect = $ButtonArea.get_child(0).get_shape()
	button_rect.set_extents(size/2)

func _process(delta):
	if (down && Input.is_action_pressed("left_mouse")):
		self.set_position(get_viewport().get_mouse_position())

func _on_WordButton_button_down():
	down = true

func _on_WordButton_button_up():
	down = false
	print(button_rect.get_extents().y)
	# if self.index is next to a button that is of one index difference:
	# 	append this name to the leftmost indexed button 
	# 	delete this button

func _on_ButtonArea_area_shape_entered(area_id, area, area_shape, self_shape):
	print(word_manager.wordDict[area.get_parent()])
