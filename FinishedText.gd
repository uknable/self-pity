extends Node2D

var line1 = false
var line2 = false
var line3 = false
var line4 = false

func _process(delta):
    if (line1):
        $Line1.add

func RevealLine(lineNum):
    match lineNum:
        0:
            $Line1.add_color_override("font_color", Color(1, 0, 0, 0))
            print("Line 1 is finished!")
        1:
            $Line1.add_color_override("font_color", Color(1, 0, 0, 0))
            print("Line 2 is finished!")
        2:
            $Line1.add_color_override("font_color", Color(1, 0, 0, 0))
            print("Line 3 is finished!")
        3:
            $Line1.add_color_override("font_color", Color(1, 0, 0, 0))
            print("Line 4 is finished!")

