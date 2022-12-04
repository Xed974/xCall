ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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
            TriggerClientEvent('esx:showNotification', source, '(~y~Information~s~)\nL\'appel à été passer avec succès.')
        else
            TriggerClientEvent('esx:showNotification', source, '(~y~Information~s~)\nAucun employé n\'est disponible.')
                return
        end
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM
