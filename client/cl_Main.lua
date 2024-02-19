local ClientPlayer, ServerPlayer, IsSpawned = PlayerId(), GetPlayerServerId(PlayerId()), true

if Config.PrintingCheck then
	print('\027[31m>>\27[0m Script: Set ped \027[31m>>\27[0m Client Side \027[31m>>\27[0m is started')
end

RegisterNetEvent('setped')
AddEventHandler('setped', function(ped)
	local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash) do
		RequestModel(hash)
		Citizen.Wait(0)
	end

	SetPlayerModel(ClientPlayer, hash)
	SetPedDefaultComponentVariation(PlayerPedId())
	ClearAllPedProps(PlayerPedId())
	ClearPedDecorations(PlayerPedId())
	ClearPedFacialDecorations(PlayerPedId())
	SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 0)
	Wait(500)
	SetPedComponentVariation(PlayerPedId(), 0, 0, 1, 0)
	Wait(500)
	SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 0)
	SetModelAsNoLongerNeeded(hash)
end)

TriggerEvent('chat:addSuggestion', Config.DeletePed.command2, Config.DeletePed.description, {
	{ name = "id",   help = Config.DeletePed['id'] },
	{ name = "delete", help = Config.DeletePed['deleteFromDatabase'] }
})

TriggerEvent('chat:addSuggestion', Config.chatSuggestion.command, Config.chatSuggestion.description, {
	{ name = "id", help = Config.chatSuggestion['id'] },
	{ name = "ped", help = Config.chatSuggestion['ped'] }
})

RegisterNetEvent('delete:ped')
AddEventHandler('delete:ped', function()
	local hash2 = GetHashKey('mp_m_freemode_01')
	RequestModel(hash2)
	while not HasModelLoaded(hash2)
	do
		RequestModel(hash2)
		Citizen.Wait(0)
	end
	SetPlayerModel(ClientPlayer, hash2)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end)

AddEventHandler('esx:onPlayerSpawn', function()
	if IsSpawned then
		TriggerServerEvent('setPed:onSpawn', ServerPlayer)
		IsSpawned = false
	end
end)