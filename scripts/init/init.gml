if (os_type == os_windows) { // por padrão já é 0
	global.Controller_mode = 0;
} else if (os_type == os_android or os_type == os_ios) {
	global.Controller_mode = 2;
}
