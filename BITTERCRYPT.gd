extends Control

var Points=0
var StartH=false
var FileHandle = File.new()

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
	FileHandle.open("user://generatedcrypts.base64.txt", File.WRITE)

func _physics_process(delta):
	$CRYPTPOINTS.text = "EN/DECRYPT POINTS: "+str(Points)+"\nSECONDS LEFT: "+str(int($TIMERTEST30S.time_left))+"s"

func _process(_delta):
	if StartH==true:
		var tmp0 = gen_unique_string(512)
		var tmp1 = Marshalls.utf8_to_base64(tmp0)
		FileHandle.store_line(tmp1)
		var tmp2 = Marshalls.base64_to_utf8(tmp1)
		FileHandle.store_line(tmp2 + "\n")
		Points+=1


func _on_TIMERTEST30S_timeout():
	StartH=false
	$TIMERSLEEP5S.start(5)
	Testglobal.BENCHPASSES[1]=Points
	Testglobal.BENCHARRAY[1]=false
	FileHandle.close()


func _on_TIMERSLEEP5S_timeout():
	Testglobal._change_scenes_of_test()
