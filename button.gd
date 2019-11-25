extends Button

signal hello

var down = false
var size
var ownDictValue
var otherDictValue
var otherButton
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
	if (ownDictValue[0] == otherDictValue[0]): # merge
		var parent = self.get_parent()

		if (ownDictValue[1] - otherDictValue[1] == 1):

			print(ownDictValue[2], " was dropped to the right of ", otherDictValue[2])
			parent.removeButton(otherButton)
			parent.removeButton(self)
			
			parent.changeDict(ownDictValue[0])

		if (ownDictValue[1] - otherDictValue[1] == -1):
			print(ownDictValue[2], " was dropped to the left of ", otherDictValue[2])
			parent.removeButton(otherButton)
			parent.removeButton(self)

			parent.changeDict(ownDictValue[0]) 
		
		# lets delete the dictionary entry and make a new one?

	down = false



func _on_ButtonArea_area_shape_entered(area_id, area, area_shape, self_shape):
	ownDictValue = word_manager.wordDict[self]

	if (down):
		emit_signal("hello", area)



func _on_hello(area):
	otherButton = area.get_parent()
	otherDictValue = word_manager.wordDict[otherButton]

	print(ownDictValue, " is saying hello to ", otherDictValue)

	if (ownDictValue[0] == otherDictValue[0]): # animation
		if (ownDictValue[1] - otherDictValue[1] == 1):
			print(self, " is to the right of ", otherButton)
		if (ownDictValue[1] - otherDictValue[1] == -1):
			print(self, " is to the left of ", otherButton)

