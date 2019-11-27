extends Button

var down = false
var hoveringOver = false

var ownLineNum
var ownWordNum

var otherButton
var otherLineNum
var otherWordNum
var otherText

func _ready():
	updateSize()

func _process(delta):
	if (down && Input.is_action_pressed("left_mouse")):
		var mousePos = get_viewport().get_mouse_position()
		self.set_position(Vector2(mousePos.x - 20, mousePos.y - 10))


func updateSize():
	var size = self.get_size()
	$ButtonArea.set_position(size/2)
	$ButtonArea.get_child(0).get_shape().set_extents(size/2)
	print(self.text, " size is ", size, " and shape extents are ", $ButtonArea.get_child(0).get_shape().get_extents())


func _on_WordButton_button_down():
	down = true



func _on_WordButton_button_up():
	if (hoveringOver && ownLineNum == otherLineNum && abs(ownWordNum - otherWordNum) == 1): # merge
		var side = ownWordNum - otherWordNum

		if (side == -1):
			print(self.text, " was dropped to the left of ", otherText)
			otherButton.text = self.text + " " + otherButton.text


		if (side == 1):
			print(self.text, " was dropped to the right of ", otherText)
			otherButton.text = otherButton.text + " " + self.text

		otherButton.updateSize()
		self.get_parent().updateDict(ownLineNum, ownWordNum)
		queue_free()

	down = false



func _on_ButtonArea_area_entered(area):
	if (down):
		hoveringOver = true

		otherButton = area.get_parent()
		otherLineNum = otherButton.ownLineNum
		otherWordNum = otherButton.ownWordNum
		otherText = otherButton.text
	
		print(self.text, ":", ownLineNum, ":", ownWordNum, " is saying hello to ", otherText, ":", otherLineNum, ":", otherWordNum)

	
		if (ownLineNum == otherLineNum && abs(ownWordNum - otherWordNum) == 1): # animation
			print(self.text, ": ", ownWordNum, " is next to ", otherText, ": ", otherWordNum) 
			# WIP
	


func _on_ButtonArea_area_exited(area):
	hoveringOver = false

func _on_dict_change(deadLineNum, line):
	
	var prevWordNum = ownWordNum

	if (ownLineNum == deadLineNum):
		ownWordNum = line.find(self)
		print(self.text, " has changed from", prevWordNum, " to", ownWordNum)
	