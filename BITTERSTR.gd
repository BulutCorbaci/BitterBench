extends Control

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
	$TIMERTEST30S.start(30)
	StartH=true

func _physics_process(delta):
	$STRPOINTS.text = "RANDOM STRING POINTS: "+str(Points)+"\nSECONDS LEFT: "+str(int($TIMERTEST30S.time_left))+"s"

func _process(_delta):
	if StartH==true:
		var tmp = gen_unique_string(512)
		Points+=1


func _on_TIMERTEST30S_timeout():
	StartH=false
	$TIMERSLEEP5S.start(5)
	Testglobal.BENCHPASSES[7]=Points
	Testglobal.BENCHARRAY[7]=false


func _on_TIMERSLEEP5S_timeout():
	Testglobal._change_scenes_of_test()
