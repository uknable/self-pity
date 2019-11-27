extends Node2D

var margin
const WORD_PADDING = 50
const SELF_PITY = [
	"I never saw a wild thing",
	"sorry for itself.",
	"A small bird will drop frozen dead from a bough",
	"without ever having felt sorry for itself"
]
var wordBut = load("res://button.tscn") as PackedScene

func _ready():
	margin = get_viewport().size.x/20

	randomize()

	for line in SELF_PITY:
		var newLine = line.split(" ")
		var lineNum = SELF_PITY.find(line)
		var wordNum = 0

		for word in newLine:
			var b = wordBut.instance()

			b.text = word
			b.ownLineNum = lineNum
			b.ownWordNum = wordNum
			wordNum += 1

			var pos = randomPos()

			b.set_position(Vector2(pos[0], pos[1]))

			add_child(b)


func randomPos():
	var xPos = int(rand_range(margin, get_viewport().size.x/2))
	var yPos = int(rand_range(margin, get_viewport().size.y - margin))
	return [xPos, yPos]

