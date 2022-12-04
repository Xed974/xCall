ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local can = true
local function notif(bool, xPlayers)
    if can then
        if bool then
            can = false
            TriggerClientEvent('esx:showNotification', source, '(~y~Information~s~)\nL\'appel à été passer avec succès.')
            TriggerClientEvent('esx:showNotification', xPlayers, '(~y~Information~s~)\nUn client recherche un employé à l\'accueil.')
            Wait(60000)
            can = true
        else
            can = false
            TriggerClientEvent('esx:showNotification', source, '(~y~Information~s~)\nAucun employé disponible.')
            Wait(60000)
            can = true
        end
    else
        TriggerClientEvent('esx:showNotification', source, '(~y~Information~s~)\nVous avez dejà envoyé un appel.')
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
            notif(true, xPlayers[i])
        else
            notif(false, xPlayers[i])
        end
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM
