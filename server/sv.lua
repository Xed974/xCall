ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local can = true
local function notif(bool)
    if can then
        if bool then
            can = false
            TriggerClientEvent('esx:showNotification', source, '(~y~Information~s~)\nL\'appel à été passer avec succès.')
            Wait(60000)
            can = true
        else
            can = false
            TriggerClientEvent('esx:showNotification', source, '(~y~Information~s~)\nAucun employé disponible.')
            Wait(60000)
            can = true
        end
    end
end

RegisterNetEvent("xCall:entreprise")
AddEventHandler("xCall:entreprise", function(job)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if (not xPlayer) then return end
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if (xPlayer.getJob().name) == job then
            TriggerClientEvent('esx:showNotification', xPlayers[i], '(~y~Information~s~)\nUn client recherche un employé à l\'accueil.')
            notif(true)
        else
            notif(false)
        end
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM
