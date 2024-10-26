Config = {
	PrintingCheck = true,
	command = 'setPed',
	DefaultPedDB = 'none',
	RequiredGroup = {
		['group1'] = "owner",
		['group2'] = "superadmin",
		['group3'] = "admin"
	},
}

Config.DeletePed = {
	command = 'DeletePed',
	command2 = '/DeletePed',
	description = 'Remove Ped from Player',
	['id'] = 'Id of Player',
	['deleteFromDatabase'] = 'true -> delete from database - - - - - - - - - - - leave blank -> remove ped [ NO DB ]'

}

Config.chatSuggestion = {

	command = '/setPed',
	description = 'Set ped to player',
	['id'] = 'Id of Player',
	['ped'] = 'Enter the name of the ped',

}

Config.Logs = {

	--[[
	green = 56108
	grey = 8421504
	red = 16711680
	orange = 16744192
	blue = 2061822
	purple = 6965387
	pink = 11750815
	yellow = 16449301
	white = 16777215
	black = 0
	tweetblue = 4436965
	--]]

	On = true,
	Color = 56108,
	AttentionColor = 16711680,
	DeleteColor = 16744192,
	webhook =
	"https://discord.com/api/webhooks/941056907068710982/6tJbNJzuqvqC6njgYC0H8ZulMbGs3g5xVDPCn7odlMmY0CISuG1hMepnWEXZK_vtJ7T0",
	Title = "✨ SET PED - LOGS",
}