extends Node2D

const INC_RATE = 1

var inc = 0

func _process(delta):
    inc += delta * INC_RATE

    var num = floor(fmod(inc+1, 10))
    var numm = floor(fmod(inc, 10))


    get_node("Sprite" + str(num)).set_visible(true)
    get_node("Sprite" + str(numm)).set_visible(false)


