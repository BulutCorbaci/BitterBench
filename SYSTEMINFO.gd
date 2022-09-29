extends RichTextLabel

var dataRam = "0mb lol"

func _ready():
	var scoretotal = 0
	for aint in Testglobal.BENCHPASSES:
		scoretotal += int(aint)
	text = "SYSTEM INFO\n-----------------\nCPU: "+ OS.get_processor_name() +"\nGPUDRIVER: "+ OS.get_video_driver_name(OS.get_current_video_driver()) +"\nAUDIO: "+OS.get_audio_driver_name(0)+"\nOS: "+OS.get_name()+"\nMODEL: "+OS.get_model_name()+"\nSCORE: "+str(scoretotal)


func _on_SYSTEMCOPY_pressed():
	var scoretotal = 0
	for aint in Testglobal.BENCHPASSES:
		scoretotal += int(aint)
	OS.clipboard = "SYSTEM INFO\n-----------------\nCPU: "+ OS.get_processor_name() +"\nGPUDRIVER: "+ OS.get_video_driver_name(OS.get_current_video_driver()) +"\nAUDIO: "+OS.get_audio_driver_name(0)+"\nOS: "+OS.get_name()+"\nMODEL: "+OS.get_model_name()+"\nSCORE: "+str(scoretotal)
