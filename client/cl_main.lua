ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 1000
    
        for _,v in pairs(xCall.Listes) do
            local pos = v.pos
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = Vdist(pPos.x, pPos.y, pPos.z, pos.x, pos.y, pos.z)

            if dst <= 3.0 then
                wait = 0
                DrawMarker(xCall.MarkerType, pos.x, pos.y, (pos.z)-1.0, 0.0, 0.0, 0.0, 0.0,0.0,0.0, xCall.MarkerSizeLargeur, xCall.MarkerSizeEpaisseur, xCall.MarkerSizeHauteur, xCall.MarkerColorR, xCall.MarkerColorG, xCall.MarkerColorB, xCall.MarkerOpacite, xCall.MarkerSaute, true, p19, xCall.MarkerTourne)
            end
            if dst <= 1.0 then
                wait = 0
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour appeler un membres de l'entreprise.")
                if IsControlJustPressed(1, 51) then
                    TriggerServerEvent("xCall:entreprise", v.job)
                end
            end
        end

        Citizen.Wait(wait)
    end
end)

--- Xed#1188 | https://discord.gg/HvfAsbgVpM