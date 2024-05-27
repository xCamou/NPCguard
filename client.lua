local spawnedNPCs = {}

RegisterNetEvent('spawnFriendlyNPC')
AddEventHandler('spawnFriendlyNPC', function(npcType)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local npcConfig = Config.NPCTypes[npcType]
    
    if not npcConfig then
        return TriggerEvent('chat:addMessage', { args = { '^1SYSTEM', 'Ungültiger NPC-Typ.' } })
    end

    local npcModel = GetHashKey(npcConfig.model)
    
    RequestModel(npcModel)

    while not HasModelLoaded(npcModel) do
        Wait(1)
    end

    local npcPed = CreatePed(4, npcModel, playerCoords.x + npcConfig.coordsOffset.x, playerCoords.y + npcConfig.coordsOffset.y, playerCoords.z + npcConfig.coordsOffset.z, 0.0, true, true)
    SetPedAsGroupMember(npcPed, GetPedGroupIndex(playerPed))
    SetPedDropsWeaponsWhenDead(npcPed, false)
    SetPedCombatAbility(npcPed, npcConfig.combatAbility)
    SetPedCombatRange(npcPed, npcConfig.combatRange)
    SetPedCombatMovement(npcPed, npcConfig.combatMovement)
    SetPedFleeAttributes(npcPed, 0, false)
    SetPedArmour(npcPed, npcConfig.armour)
    GiveWeaponToPed(npcPed, GetHashKey(npcConfig.weapon), 250, false, true)

    spawnedNPCs[#spawnedNPCs+1] = npcPed
    TriggerEvent('chat:addMessage', { args = { '^2SYSTEM', npcType .. ' wurde gespawnt und folgt dir nun.' } })
end)

-- Cleanup spawned NPCs when player disconnects
AddEventHandler('playerDropped', function()
    for k,v in pairs(spawnedNPCs) do
        DeleteEntity(v)
    end
    spawnedNPCs = {}
end)
