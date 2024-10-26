if Config.PrintingCheck then
	print('\027[31m>>\27[0m Script: Set ped \027[31m>>\27[0m Server Side \027[31m>>\27[0m is started')
	function Check(msg)
		print(msg)
	end
else
	function Check()
	end
end

if Config.Logs.On then
	function DiscordLogs(player, msg, color)
		local SetPedWebhook =
		""
		local embeds = {
			{
				["title"] = msg,
				["type"] = "rich",
				["color"] = Config.Logs.Color,
				["footer"] = {
					["text"] = Config.Logs.Title,
				},
			}
		}
		if color == 1 then
			embeds = {
				{
					["title"] = msg,
					["type"] = "rich",
					["color"] = Config.Logs.AttentionColor,
					["footer"] = {
						["text"] = Config.Logs.Title,
					},
				}
			}
		end
		if color == 2 then
			embeds = {
				{
					["title"] = msg,
					["type"] = "rich",
					["color"] = Config.Logs.DeleteColor,
					["footer"] = {
						["text"] = Config.Logs.Title,
					},
				}
			}
		end
		if msg == nil or msg == '' then return FALSE end
		PerformHttpRequest(SetPedWebhook, function(err, text, headers) end, 'POST',
			json.encode({ username = player, embeds = embeds }), { ['Content-Type'] = 'application/json' })
	end
else
	function DiscordLogs()
	end
end

RegisterCommand(Config.DeletePed.command, function(source, args)
	id = args[1]
	deleteFromDatabase = args[2]
	local Player = ESX.GetPlayerFromId(id)
	local Admin = ESX.GetPlayerFromId(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if Admin.getGroup() == 'superadmin' then
		if id ~= nil and Player ~= nil then
			if deleteFromDatabase == 'true' then
				--	local identifier2 = ESX.GetIdentifier(id)
				TriggerClientEvent('delete:ped', id)
				MySQL.Async.execute('UPDATE users SET ped = @ped WHERE identifier = @rockstarId', {
					['@ped'] = Config.DefaultPedDB,
					['@rockstarId'] = xPlayer.identifier,
				})
				Check('You have required group >> Ped is delete [DB]')
				DiscordLogs('Delete Ped Script',
					'Admin: ```' ..
					GetPlayerName(source) ..
					'```,\nPlayer: ```' ..
					GetPlayerName(id) ..
					'``` ID: ```' .. id .. '```,\nThe admin deleted the player"s ped from the database', 2)
			else
				TriggerClientEvent('delete:ped', id)
				Check('You have required group >> Ped is delete')
				DiscordLogs('Delete Ped Script',
					'Admin: ```' ..
					GetPlayerName(source) ..
					'```,\nPlayer: ```' ..
					GetPlayerName(id) .. '``` ID: ```' .. id .. '```,\nThe admin deleted the player"s ped', 2)
			end
		else
			Check('Player not on server >> Ped is not delete')
		end
	else
		Check('You dont have required group >> Ped is not delete')
		if id ~= nil and Player ~= nil then
			DiscordLogs('Attention - Delete Ped Script',
				'Player: ```' ..
				GetPlayerName(source) ..
				'``` Group: ```' ..
				Admin.getGroup() ..
				'```,\n‼ He tried to delete Ped from the Player2 \nPlayer2: ```' ..
				GetPlayerName(id) .. '``` ID: ```' .. id .. '```', 1)
		else
			DiscordLogs('Attention - Delete Ped Script',
				'Player: ```' ..
				GetPlayerName(source) .. '``` Group: ```' .. Admin.getGroup() .. '```,\n‼ He tried to delete Ped', 1)
		end
	end
end)

RegisterCommand(Config.command, function(source, args)
	id = args[1]
	ped = args[2]
	local Admin = ESX.GetPlayerFromId(source)
	local Player = ESX.GetPlayerFromId(id)
	local xPlayer = ESX.GetPlayerFromId(source)
	if Admin.getGroup() == 'superadmin' then
		if id ~= nil and Player ~= nil then
			if ped ~= nil then
				TriggerClientEvent('setped', id, ped)
				MySQL.Async.execute('UPDATE users SET ped = @ped WHERE identifier = @rockstarId', {
					['@rockstarId'] = xPlayer.identifier,
					['@ped'] = ped,
				})
				Check('You have required group >> Ped is set')
				DiscordLogs('Set Ped Script',
					'Admin: ```' ..
					GetPlayerName(source) ..
					'```,\nPlayer: ```' .. GetPlayerName(id) .. '``` ID: ```' .. id .. '```,\nPed: ```' .. ped .. '```',
					0)
			else
				Check('You did not enter a model >> Ped is not set')
			end
		else
			Check('Player not on server >> Ped is not set')
		end
	else
		Check('You dont have required group >> Ped is not set')
		if id ~= nil and Player ~= nil then
			if ped ~= nil then
				DiscordLogs('Attention - Set Ped Script',
					'Player: ```' ..
					GetPlayerName(source) ..
					'``` Group: ```' ..
					Admin.getGroup() ..
					'```,\n‼ He tried to set Ped to the Player2 \nPlayer2: ```' ..
					GetPlayerName(id) .. '``` ID: ```' .. id .. '```,\nPed: ```' .. ped .. '```', 1)
			else
				DiscordLogs('Attention - Set Ped Script',
					'Player: ```' ..
					GetPlayerName(source) ..
					'``` Group: ```' ..
					Admin.getGroup() ..
					'```,\n‼ He tried to set Ped to the Player2 \nPlayer2: ```' ..
					GetPlayerName(id) .. '``` ID: ```' .. id .. '```', 1)
			end
		else
			DiscordLogs('Attention - Set Ped Script',
				'Player: ```' ..
				GetPlayerName(source) ..
				'``` Group: ```' .. Admin.getGroup() .. '```,\n‼ He tried to set Ped to the Player2 \n', 1)
		end
	end
end)

RegisterServerEvent('gjn_setped:setPed:onSpawn')
AddEventHandler('gjn_setped:setPed:onSpawn', function(id)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = ESX.GetIdentifier(source)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @rockstarId', {
		['@rockstarId'] = xPlayer.identifier,
	}, function(result)
		if result[1].ped ~= Config.DefaultPedDB then
			TriggerClientEvent('setped', id, result[1].ped)
			Check('You have a ped in the database >> Your ped is set')
		else
			Check('You dont have a ped in the database >> Your ped is not set')
		end
	end)
end)