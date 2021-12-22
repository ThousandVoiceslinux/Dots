local awful = require('awful')
local beautiful = require('beautiful')

require('awful.autofocus')

local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').mod_key
local altkey = require('configuration.keys.mod').alt_key
local apps = require('configuration.apps')

-- ============
-- Key bindings
-- ============

local global_keys = awful.util.table.join(
	
	-- =============
	-- own shortcuts
	-- =============
	awful.key({modkey}, 'd',
	function()	
		awful.util.spawn('discord')
	end,
	{description = 'discord', group = 'applications'}
	),
	
	awful.key({modkey}, 't',
	function()	
		awful.util.spawn('texstudio')
	end,
	{description = 'texstudio', group = 'applications'}
	),

	awful.key({modkey}, 'm',
	function()	
		awful.util.spawn('minecraft-launcher')
	end,
	{description = 'minecraft', group = 'applications'}
	),

	awful.key({modkey, 'Shift'}, 'n',
	function()
		awful.util.spawn('noisetorch')
	end,
	{descritption = 'noisetorch', groupt = 'applications'}
	),

	awful.key({modkey, 'Shift'}, 's',
	function()
		awful.util.spawn('steam')
	end,
	{description = 'Steam', group = 'applications'}
	),

	awful.key({modkey}, 'c',
	function()	
		awful.util.spawn('pavucontrol')
	end,
	{description = 'pavucontrol', group = 'applications'}
	),

	awful.key({modkey}, 'b',
	function()
		awful.util.spawn('firefox')
	end,
	{description = 'firefox', group = 'applications'}
	),

	awful.key({modkey}, 'n',
	function()
		awful.util.spawn('noson-app')
	end,
	{description = 'noson', group = 'applications'}
	),
	
	awful.key({modkey}, 'r',
	function()
		awful.util.spawn('dmenu_run')
	end,
	{description = 'dmenu', group = 'applications'}
	),

	awful.key({modkey, "Shift"}, 't',
	function()
		awful.util.spawn('teams')
	end,
	{description = 'teams', group = 'applications'}
	),

	awful.key({modkey, 'Shift'}, 'b',
	function()
		awful.util.spawn('bitwarden-desktop')
	end,
	{description = 'Bitwarden', group = 'applications'}
	),

	
	awful.key({modkey}, 'x',
	function()
		awful.util.spawn('alacritty')
	end,
	{description = 'alacritty', group = 'applications'}
	),

	awful.key({modkey}, 's',
	function()
		awful.util.spawn('spotify')
	end,
	{description = 'spotify', group = 'applications'}
	),

	awful.key({modkey}, 'f',
	function()
		awful.util.spawn('freetube')
	end,
	{description = 'freetube', group = 'applications'}
	),

	awful.key({modkey}, 'p',
	function()
		awful.util.spawn('pcmanfm')
	end,
	{description = 'pcmanfm', group = 'applications'}
	),
	-- =======
	-- awesome
	-- =======

	awful.key({modkey}, 'F1', 
		hotkeys_popup.show_help, 
		{description = 'show help', group = 'awesome'}
	),

	awful.key({modkey, 'Control'}, 'r', 
		awesome.restart, 
		{description = 'reload awesome', group = 'awesome'}
	),
	

	awful.key({modkey, 'Control'}, 'q', 
		awesome.quit, 
		{description = 'quit awesome', group = 'awesome'}
	),
	
	-- ======
	-- layout
	-- ======

	awful.key({altkey}, 'l',
		function()
			awful.tag.incmwfact(0.05)
		end,
		{description = 'increase master width factor', group = 'layout'}
	),

	awful.key({altkey, 'Shift'}, 'h',
		function()
			awful.tag.incmwfact(-0.05)
		end,
		{description = 'decrease master width factor', group = 'layout'}
	),

	awful.key({modkey, 'Shift'}, 'h',
		function()
			awful.tag.incnmaster(1, nil, true)
		end,
		{description = 'increase the number of master clients', group = 'layout'}
	),

	awful.key({modkey, 'Shift'}, 'l',
		function()
			awful.tag.incnmaster(-1, nil, true)
		end,
		{description = 'decrease the number of master clients', group = 'layout'}
	),
	
	awful.key({modkey, 'Control'}, 'h',
		function()
			awful.tag.incncol(1, nil, true)
		end,
		{description = 'increase the number of columns', group = 'layout'}
	),

	awful.key({modkey, 'Control'},'l',
		function()
			awful.tag.incncol(-1, nil, true)
		end,
		{description = 'decrease the number of columns', group = 'layout'}
	),

	awful.key({modkey},'space',
		function()
			awful.layout.inc(1)
		end,
		{description = 'select next layout', group = 'layout'}
	),

	awful.key({modkey, 'Shift'}, 'space',
		function()
			awful.layout.inc(-1)
		end,
		{description = 'select previous layout', group = 'layout'}
	),

	-- ===
	-- tag
	-- ===
	
	awful.key({modkey}, 'w', 
		awful.tag.viewprev, 
		{description = 'view previous tag', group = 'tag'}
	),

	awful.key({modkey, 'Shift'},'w', 
		awful.tag.viewnext, 
		{description = 'view next tag', group = 'tag'}
	),

	awful.key({modkey}, 'Escape', 
		awful.tag.history.restore, 
		{description = 'alternate between current and previous tag', group = 'tag'}
	),

	awful.key({ modkey, 'Control' }, 'w',
		function ()
			-- tag_view_nonempty(-1)
			local focused = awful.screen.focused()
			for i = 1, #focused.tags do
				awful.tag.viewidx(-1, focused)
				if #focused.clients > 0 then
					return
				end
			end
		end, 
		{description = 'view previous non-empty tag', group = 'tag'}
	),

	awful.key({ modkey, 'Control' }, 's',
		function ()
			-- tag_view_nonempty(1)
			local focused =  awful.screen.focused()
			for i = 1, #focused.tags do
				awful.tag.viewidx(1, focused)
				if #focused.clients > 0 then
					return
				end
			end
		end, 
		{description = 'view next non-empty tag', group = 'tag'}
	),

	-- ======
	-- screen
	-- ======

	awful.key({modkey, 'Shift'}, 'F1',
		function() 
			awful.screen.focus_relative(-1) 
		end,
		{ description = 'focus the previous screen', group = 'screen'}
	),

	awful.key({modkey, 'Shift'}, 'F2', 
		function()
			awful.screen.focus_relative(1)
		end,
		{ description = 'focus the next screen', group = 'screen'}
	),

	awful.key({modkey, 'Control'}, 'n',
		function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal('request::activate')
				c:raise()
			end
		end,
		{description = 'restore minimized', group = 'screen'}
	),

	-- ========
	-- launcher
	-- ========
	
	awful.key({modkey}, '`',
		function()
			awesome.emit_signal('module::quake_terminal:toggle')
		end,
		{description = 'dropdown application', group = 'launcher'}
	),

	awful.key(
		{modkey, 'Shift'}, 'e',
		function()
			awful.spawn(apps.default.file_manager)
		end,
		{description = 'open default file manager', group = 'launcher'}
	),

	awful.key({'Control', 'Shift'}, 'Escape',
		function()
			awful.spawn(apps.default.terminal .. ' ' .. 'htop')
		end,
		{description = 'open system monitor', group = 'launcher'}
	),

	awful.key({modkey}, 'e',
		function()
			local focused = awful.screen.focused()

			if focused.left_panel then
				focused.left_panel:hide_dashboard()
				focused.left_panel.opened = false
			end
			if focused.right_panel then
				focused.right_panel:hide_dashboard()
				focused.right_panel.opened = false
			end
			awful.spawn(apps.default.rofi_appmenu, false)
		end,
		{description = 'open application drawer', group = 'launcher'}
	),


	awful.key({modkey}, 'F2',
		function()
			local focused = awful.screen.focused()

			if focused.left_panel and focused.left_panel.opened then
				focused.left_panel:toggle()
			end

			if focused.right_panel then
				if _G.right_panel_mode == 'today_mode' or not focused.right_panel.visible then
					focused.right_panel:toggle()
					switch_rdb_pane('today_mode')
				else
					switch_rdb_pane('today_mode')
				end

				_G.right_panel_mode = 'today_mode'
			end
		end,
		{description = 'open today pane', group = 'launcher'}
	),

	awful.key({modkey}, 'F3',
		function()
			local focused = awful.screen.focused()

			if focused.left_panel and focused.left_panel.opened then
				focused.left_panel:toggle()
			end

			if focused.right_panel then
				if _G.right_panel_mode == 'notif_mode' or not focused.right_panel.visible then
					focused.right_panel:toggle()
					switch_rdb_pane('notif_mode')
				else
					switch_rdb_pane('notif_mode')
				end

				_G.right_panel_mode = 'notif_mode'
			end
		end,
		{description = 'open notification center', group = 'launcher'}
	),

	-- =======
	-- utility
	-- =======
	
	awful.key({ }, 'Print',
		function ()
			awful.spawn.easy_async_with_shell(apps.utils.full_screenshot,function() end)
		end,
		{description = 'fullscreen screenshot', group = 'Utility'}
	),

	awful.key({altkey, 'Shift'}, 's',
		function ()
			awful.spawn.easy_async_with_shell(apps.utils.area_screenshot,function() end)
		end,
		{description = 'area/selected screenshot', group = 'Utility'}
	)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 9 then
		descr_view = {description = 'view tag #', group = 'tag'}
		descr_toggle = {description = 'toggle tag #', group = 'tag'}
		descr_move = {description = 'move focused client to tag #', group = 'tag'}
		descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
	end
	global_keys =
		awful.util.table.join(
		global_keys,
		-- View tag only.
		awful.key(
			{modkey},
			'#' .. i + 9,
			function()
				local focused = awful.screen.focused()
				local tag = focused.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			descr_view
		),
		-- Toggle tag display.
		awful.key(
			{modkey, 'Control'},
			'#' .. i + 9,
			function()
				local focused = awful.screen.focused()
				local tag = focused.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
			descr_toggle
		),
		-- Move client to tag.
		awful.key(
			{modkey, 'Shift'},
			'#' .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			descr_move
		),
		-- Toggle tag on focused client.
		awful.key(
			{modkey, 'Control', 'Shift'},
			'#' .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			descr_toggle_focus
		)
	)
end

return global_keys
