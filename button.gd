extends Button

const FADE_IN = 0.7

var down = false
var fading = false

var ownLineNum
var ownWordNum

var otherButton
var otherLineNum
var otherWordNum
var otherText

var normal_style = load("res://normal.tres") as StyleBoxEmpty
var adjacent_style = load("res://highlight_adjacent.tres") as StyleBoxFlat


func _ready():
	updateSize()



func _physics_process(delta):
	if (fading):
		self.modulate.a -= delta * FADE_IN

		if (self.modulate.a <= 0):
			fading = false

	if (down && Input.is_action_pressed("left_mouse")):
		var mousePos = get_viewport().get_mouse_position()
		self.set_position(mousePos - self.get_size()/2)



func updateSize(sizeAdd = Vector2(0, 0)):
	var size = Vector2(self.get_size().x + sizeAdd.x, self.get_size().y)
	print(self.text, " size: ", size)
	$ButtonArea.set_position(size/2)
	$ButtonArea.get_child(0).get_shape().set_extents(size/2)
	print("Text: " , self.text, ". Size: ", size, ". Shape extents: ", $ButtonArea.get_child(0).get_shape().get_extents(), ". Position: ", $ButtonArea.get_position())



func _on_WordButton_button_down():
	down = true



func _on_WordButton_button_up():
	if (ownLineNum == otherLineNum && abs(ownWordNum - otherWordNum) == 1): # merge
		var side = ownWordNum - otherWordNum

		if (side == -1):
			# print(self.text, " was dropped to the left of ", otherText)
			otherButton.text = self.text + " " + otherButton.text


		if (side == 1):
			# print(self.text, " was dropped to the right of ", otherText)
			otherButton.text = otherButton.text + " " + self.text

		otherButton.updateSize(self.get_size())
		self.get_parent().updateDict(ownLineNum, ownWordNum)
	
		queue_free()

	down = false



func _on_ButtonArea_area_entered(area):
	if (down):
		
		otherButton = area.get_parent()
		otherLineNum = otherButton.ownLineNum
		otherWordNum = otherButton.ownWordNum
		otherText = otherButton.text

		print(self.text, " Size: ", self.get_size(), " is saying hello to ", otherButton.text, " Size: ", otherButton.get_size())
	
		if (ownLineNum == otherLineNum && abs(ownWordNum - otherWordNum) == 1): # animation
			# print(self.text, ": ", ownWordNum, " is next to ", otherText, ": ", otherWordNum)
			area.get_parent().add_stylebox_override("normal", adjacent_style)



func _on_ButtonArea_area_exited(area):
	area.get_parent().add_stylebox_override("normal", normal_style)
	


func _on_dict_change(deadLineNum, line):
	
	
	if (ownLineNum == deadLineNum):
		ownWordNum = line.find(self)
