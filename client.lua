local firstspawn = true

AddEventHandler('playerSpawned', function ()
    if firstspawn then
        TriggerServerEvent('byk3_save:server:load')
    end
end)

