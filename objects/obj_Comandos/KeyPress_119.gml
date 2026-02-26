global.MUTED = !global.MUTED;
if (global.MUTED) {
	audio_pause_all();
} else {
	audio_resume_all();
}