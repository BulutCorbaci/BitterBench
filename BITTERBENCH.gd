extends Control

func _ready():
	var filehandler = File.new()
	if filehandler.file_exists("user://scorestore"):
		filehandler.open("user://scorestore", File.READ)
		Testglobal.BENCHPASSES = filehandler.get_var()
		filehandler.close()


func _on_STARTBM_pressed():
	var itmp = 0
	for b in $SCROLLCONT/VBOXCONT.get_children():
		Testglobal.BENCHARRAY[itmp] = b.pressed
		itmp+=1
	Testglobal._change_scenes_of_test()
