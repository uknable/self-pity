extends Button

signal hello

var down = false
var size
var ownDictValue
var button_rect
const SNAP_RADIUS = 10

func _ready():
	connect("button_down", self, "_on_WordButton_button_down")
	connect("button_up", self, "_on_WordButton_button_up")
	connect("hello", self, "_on_hello")

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



func _on_ButtonArea_area_shape_entered(area_id, area, area_shape, self_shape):
	ownDictValue = word_manager.wordDict[self]

	if (down):
		emit_signal("hello", area)

	

func _on_hello(area):
	var dicValue = word_manager.wordDict[area.get_parent()]

	print(ownDictValue, " is saying hello to ", dicValue)

	if (ownDictValue[0] == dicValue[0]):
		if (ownDictValue[1] - dicValue[1] == 1 && Input.is_action_just_released("left_mouse")):
			print(ownDictValue[2], " was dropped to the right of ", dicValue[2])
		if (ownDictValue[1] - dicValue[1] == -1 && Input.is_action_just_released("left_mouse")):
			print(ownDictValue[2], " was dropped to the left of ", dicValue[2])
