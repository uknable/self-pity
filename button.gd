extends Button

signal hello
signal imDie

var down = false
var size
var ownLineNum
var ownWordNum
var otherLineNum
var otherWordNum
var otherButton
var otherText
var button_rect

func _ready():
	connect("button_down", self, "_on_WordButton_button_down")
	connect("button_up", self, "_on_WordButton_button_up")
	connect("imDie", self, "_on_die")

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
	if (ownLineNum == otherLineNum): # merge
		var parent = self.get_parent()
		var side = ownWordNum - otherWordNum

		if (side == -1):
			print(self.text, " was dropped to the left of ", otherText)
			otherButton.text = self.text + " " + otherButton.text
			emit_signal("imDie", ownLineNum, ownWordNum)


		if (side == 1):
			print(self.text, " was dropped to the right of ", otherText)
			otherButton.text = otherButton.text + " " + self.text
			emit_signal("imDie", ownLineNum, ownWordNum)

	down = false



func _on_ButtonArea_area_shape_entered(area_id, area, area_shape, self_shape):
	if (down):
		otherButton = area.get_parent()
		otherLineNum = otherButton.ownLineNum
		otherWordNum = otherButton.ownWordNum
		otherText = otherButton.text
	
		print(self.text, ":", ownLineNum, ":", ownWordNum, " is saying hello to ", otherText, ":", otherLineNum, ":", otherWordNum)
	
		if (ownLineNum == otherLineNum): # animation
			if (ownWordNum - otherWordNum == 1):
				print(self.text, ": ", ownWordNum, " is to the right of ", otherText, ": ", otherWordNum)
			if (ownWordNum - otherWordNum == -1):
				print(self.text, ": ", ownWordNum, " is to the left of ", otherText, ": ", otherWordNum)



func _on_die(deadLineNum, deadWordNum):
	print(self.text, ":", ownLineNum, ":", ownWordNum)
	if (ownWordNum > deadWordNum):
		ownWordNum -= 1

	queue_free()






func _on_ButtonArea_area_shape_exited(area_id, area, area_shape, self_shape):
	otherButton = 0
	otherLineNum = 0
	otherWordNum = 0
	otherText = 0
