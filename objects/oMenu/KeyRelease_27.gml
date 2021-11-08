/// @description 
if(open){
	event_user(15)
	audio_resume_all()
}
else{
	event_user(14)
	audio_pause_all()	
}
	

open = !open