pedtable = {}

AddEventHandler('onResourceStart', function (resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    loadDatabase()
    print ('[byK3 - PED SYSTEM] Loaded Database')
end)

loadDatabase = function()
    local file = json.decode(LoadResourceFile(GetCurrentResourceName(), "save.json")) or {}
    pedtable = file
end

saveDatabase = function()
    SaveResourceFile(GetCurrentResourceName(), 'save.json', json.encode(pedtable), -1)
end

RegisterCommand(Config.Command, function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    local TargetID = tonumber(args[1])
    local pedModel = args[2]

    if Config.Permission[group] then
        if TargetID ~= nil and pedModel ~= nil then
            local xTarget = ESX.GetPlayerFromId(TargetID)
            local xPed = GetPlayerPed(TargetID)
            local identifier = xTarget.identifier
            local currentModel = GetEntityModel(xPed)

            if pedModel == 'reset' then
                if pedtable[identifier] ~= nil then
                    SetPlayerModel(TargetID, Config.defaultPed)
                    notify(source, 'You have reset ' .. xTarget.getName() .. '\'s model')
                    pedtable[identifier] = nil
                    saveDatabase()
                else
                    notify (source, xTarget.getName() .. ' does not have a custom model')
                end
            else
                SetPlayerModel(TargetID, pedModel)
                notify(source, 'You have set ' .. xTarget.getName() .. '\'s model to ' .. pedModel)
                local data = {
                    ['name'] = xTarget.getName(),
                    ['model'] = pedModel
                }
                pedtable[identifier] = data
                saveDatabase()
                print ('[byK3 - PED SYSTEM] ' .. xPlayer.getName() .. ' set ' .. xTarget.getName() .. '\'s model to ' .. pedModel)
            end
        else
            notify(source, 'Invalid arguments')
        end
    else
        notify(source, 'You do not have permission to use this command')
    end
end, false)



RegisterNetEvent('byk3_save:server:load')
AddEventHandler('byk3_save:server:load', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    local pedModel = pedtable[identifier].model
    local pedName = pedtable[identifier].name

    if pedModel ~= nil then
        SetPlayerModel(source, pedModel)
        print ('[byK3 - PED SYSTEM] ' .. xPlayer.getName() .. ' loaded ' .. pedName .. ' (' .. pedModel .. ')')
    end
end)
