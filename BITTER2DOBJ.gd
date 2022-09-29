extends Node2D

var Points=0
var StartH=false

var ascii_letters_and_digits = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
func gen_unique_string(length: int) -> String:
	var result = ""
	for i in range(length):
		result += ascii_letters_and_digits[randi() % ascii_letters_and_digits.length()]
	return result

func _ready():
	randomize()
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	$TIMERTEST60S.start(30)
	StartH=true

func _physics_process(delta):
	$"2DOBJPOINTS".text = "2D OBJECT RENDER POINTS: "+str(int(Points))+"\nSECONDS LEFT: "+str(int($TIMERTEST60S.time_left))+"s"

func _process(_delta):
	if StartH:
		Points+=.2


func _on_TIMERTEST60S_timeout():
	StartH=false
	$TIMERSLEEP5S.start(5)
	Testglobal.BENCHPASSES[4]=int(Points)
	Testglobal.BENCHARRAY[4]=false
	for c in get_children():
		if c.get_meta("pinball"):
			c.queue_free()


func _on_TIMERSLEEP5S_timeout():
	Testglobal._change_scenes_of_test()
