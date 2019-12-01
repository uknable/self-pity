extends Node2D

const FADE = 0.7

var line1 = false
var line2 = false
var line3 = false
var line4 = false
var bread = false


func _physics_process(delta):
    if (line1):
        $Line1.modulate.a += delta * FADE

        if ($Line1.modulate.a > 1):
            $Line1.modulate.a = 1
            line1 = false

            if ($Line1.modulate.a >= 1 && $Line2.modulate.a >= 1 && $Line3.modulate.a >= 1 && $Line4.modulate.a >= 1):
                bread = true


    if (line2):
        $Line2.modulate.a += delta * FADE

        if ($Line2.modulate.a > 1):
            $Line2.modulate.a = 1
            line2 = false

            if ($Line1.modulate.a >= 1 && $Line2.modulate.a >= 1 && $Line3.modulate.a >= 1 && $Line4.modulate.a >= 1):
                bread = true

    if (line3):
        $Line3.modulate.a += delta * FADE

        if ($Line3.modulate.a > 1):
            $Line3.modulate.a = 1
            line3 = false

            if ($Line1.modulate.a >= 1 && $Line2.modulate.a >= 1 && $Line3.modulate.a >= 1 && $Line4.modulate.a >= 1):
                bread = true
    
    if (line4):
        $Line4.modulate.a += delta * FADE

        if ($Line4.modulate.a > 1):
            $Line4.modulate.a = 1
            line4 = false

            if ($Line1.modulate.a >= 1 && $Line2.modulate.a >= 1 && $Line3.modulate.a >= 1 && $Line4.modulate.a >= 1):
                bread = true

    
    if (bread):
        $Author.modulate.a += delta * FADE
        $Title.modulate.a += delta * FADE

        if ($Author.modulate.a > 1 && $Title.modulate.a > 1):
            $Author.modulate.a = 1
            $Title.modulate.a = 1
            bread = false

func RevealLine(lineNum):
    match lineNum:
        0:
            line1 = true
        1:
            line2 = true
        2:
            line3 = true
        3:
            line4 = true    

