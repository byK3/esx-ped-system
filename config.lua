Config = {}


Config.Permission = {

    ["superadmin"] = true,
    ["moderator"] = true
}

Config.defaultPed = mp_m_freemode_01

Config.Command = 'setPed'

notify = function(source, msg)
    TriggerClientEvent('esx:showNotification', source, msg)
end