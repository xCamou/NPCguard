RegisterCommand('spawnnpc', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local npcType = args[1]

    if npcType and Config.NPCTypes[npcType] then
        TriggerClientEvent('spawnFriendlyNPC', source, npcType)
    else
        TriggerClientEvent('esx:showNotification', source, 'Bitte gebe einen gültigen NPC-Typ an.')
    end
end, false)
