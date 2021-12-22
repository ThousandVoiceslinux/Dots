local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. 'utilities/'

return {
	-- The default applications that we will use in keybindings and widgets
	default = {
		-- Default terminal emulator
		terminal = 'alacritty',
		-- Default web browser
		web_browser = 'firefox',
		-- Default text editor
		-- text_editor = 'subl3',
		-- Default file manager
		file_manager = 'pcmanfm',
		-- Default media player
		multimedia = 'vlc',
		-- Default graphics editor
		graphics = 'krita',
		-- Default sandbox
		sandbox = 'virtualbox',
		-- Default IDE
		development = '',
		-- Default network manager
		network_manager = 'kitty iwctl',
		-- Default bluetooth manager
		bluetooth_manager = 'blueman-manager',
		-- Default power manager
		power_manager = 'xfce4-power-manager',
		-- Default quake terminal
		quake = 'kitty --name QuakeTerminal'
	},

	-- List of apps to start once on start-up
	run_on_start_up = {
		-- Compositor
		'picom -b --experimental-backends --dbus --config ' ..
		config_dir .. '/configuration/picom.conf',
		-- Blueman applet
		'blueman-applet',
		-- Music server
		'mpd',
		-- Polkit and keyring
		'/usr/bin/lxqt-policykit-agent &' ..
		' eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
		-- Load X colors
		'xrdb $HOME/.Xresources',
		-- Audio equalizer
		'pulseeffects --gapplication-service',
		-- Lockscreen timer
		[[
		xidlehook --not-when-fullscreen --not-when-audio --timer 600 \
		"awesome-client 'awesome.emit_signal(\"module::lockscreen_show\")'" ""
		]],

		-- You can add more start-up applications here
		-- Nitrogen
		'nitrogen --restore',
		-- bindkeys
		'xbindkeys'
	},

	-- List of binaries/shell scripts that will execute for a certain task
	utils = {
		-- Fullscreen screenshot
		full_screenshot = utils_dir .. 'snap full',
		-- Area screenshot
		area_screenshot = utils_dir .. 'snap area',
		-- Update profile picture
		update_profile  = utils_dir .. 'profile-image'
	}
}
