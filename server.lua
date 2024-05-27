RegisterCommand('spawnnpc', function(source, args, rawCommand)
    if not args then TriggerClientEvent('esx:showNotification', source, 'Bitte gebe einen gültigen NPC-Typ an.') return end
    local npcType = tostring(args[1])
    if Config.NPCTypes[npcType] then
        TriggerClientEvent('spawnFriendlyNPC', source, npcType)
    end
end, false)
