extends Node2D

signal dict_changed

var margin
const SELF_PITY = [
	"I never saw a wild thing",
	"sorry for itself.",
	"A small bird will drop frozen dead from a bough",
	"without ever having felt sorry for itself"
]
var wordBut = load("res://button.tscn") as PackedScene
var wordDict = {}

func _ready():

	margin = get_viewport().size.x/20

	randomize()

	for line in SELF_PITY:
		var newLine = line.split(" ")
		var lineNum = SELF_PITY.find(line)
		var wordNum = 0

		var buttonArray = []

		for word in newLine:
			var b = wordBut.instance()

			b.text = word
			b.ownLineNum = lineNum
			b.ownWordNum = wordNum
			wordNum += 1

			var pos = randomPos()

			b.set_position(Vector2(pos[0], pos[1]))

			buttonArray.append(b)
			add_child(b)
			connect("dict_changed", b, "_on_dict_change")
		
		wordDict[SELF_PITY.find(line)] = buttonArray

func randomPos():
	var xPos = int(rand_range(margin, get_viewport().size.x/2))
	var yPos = int(rand_range(margin, get_viewport().size.y - margin))
	return [xPos, yPos]

	
func updateDict(lineNum, wordNum):
	wordDict.get(lineNum).remove(wordNum)
	emit_signal("dict_changed", lineNum, wordDict.get(lineNum))
	CheckLines()


func CheckLines():
	print("checking lines")
	for line in wordDict:
		if (wordDict[line].size() == 1):
			get_parent().get_node("FinishedText").RevealLine(line)
			wordDict.get(line)[0].fading = true