extends Node2D


const INC_RATE = 0.5

var inc = 0

func _process(delta):
    inc += delta * 0.5
    
    get_node("Sprite" + str(floor(fmod(inc, 10)))).set_visible(true)


