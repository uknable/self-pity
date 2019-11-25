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
	
	print("margin: ", margin, ", viewport: ", get_viewport().size.x, " x ", get_viewport().size.y) #dev

	var wordPos = []

	for line in SELF_PITY:
		var newLine = line.split(" ")
		var lineNum = SELF_PITY.find(line)
		var wordNum = 0

		for word in newLine:
			var b = wordBut.instance()
			b.text = word

			var pos = randomPos()


			if wordPos.size() != 0:
				for position in wordPos:
					var xGap = abs(position[0] - pos[0])
					var yGap = abs(position[1] - pos[1])
					while (xGap <= WORD_PADDING || yGap <= WORD_PADDING):
						pos = randomPos()
						xGap = abs(position[0] - pos[0])
						yGap = abs(position[1] - pos[1])
						print("Word: ", word, ". wordPos index: ", wordPos.find(position), ". Remaking pos because ", pos, " is too close to ", position, ". xGap: ", xGap, ". yGap: ", yGap) #dev
						
			
			wordPos.append(pos)
			print("wordPos index: ", wordPos.size()-1, ". Appending new pos: ", pos) #dev
			b.set_position(Vector2(pos[0], pos[1]))
			add_child(b)

			word_manager.wordDict[b] = [
				lineNum,
				wordNum,
				word
			]
			wordNum += 1
			
	
	print(wordPos) #dev
	print(word_manager.wordDict) #dev

func randomPos():
	var xPos = int(rand_range(margin, get_viewport().size.x/2))
	var yPos = int(rand_range(margin, get_viewport().size.y - margin))
	return [xPos, yPos]