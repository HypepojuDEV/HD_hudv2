ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while true do  
        Citizen.Wait(1000) -- Update every second
        DisplayRadar(false)
        HideHudComponentThisFrame(1) -- Wanted Stars
        HideHudComponentThisFrame(2) -- Weapon Icon
        HideHudComponentThisFrame(3) -- Cash
        HideHudComponentThisFrame(4) -- MP Cash
        HideHudComponentThisFrame(5) -- MP Message
        HideHudComponentThisFrame(6) -- Vehicle Name
        HideHudComponentThisFrame(7) -- Area Name
        HideHudComponentThisFrame(8) -- Vehicle Class
        HideHudComponentThisFrame(9) -- Street Name
        HideHudComponentThisFrame(10) -- Help Text
        HideHudComponentThisFrame(11) -- Floating Help Text
        HideHudComponentThisFrame(12) -- Cash Change
        HideHudComponentThisFrame(13) -- Reticle
        HideHudComponentThisFrame(14) -- Subtitle Text
        HideHudComponentThisFrame(15) -- Radio Stations Wheel
        HideHudComponentThisFrame(20) -- Weapon Wheel
        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed) - 100  
        local playerId = GetPlayerServerId(PlayerId())

        ESX.TriggerServerCallback('esx:getPlayerData', function(data)
            local money = data.money  
            local wallet = data.wallet
            local job = data.job.name  
            local grade = data.job.grade_label

            SendNUIMessage({
                type = 'updateHUD',
                locale = 'en', -- or any other language/locale identifier
                locales = {
                    health = Config.Labels.health,
                    wallet = Config.Labels.wallet,
                    money = Config.Labels.money,
                    id = Config.Labels.id
                },
                wallet = wallet, -- Lähetetään käteistiedot NUI:lle
                money = money,
                health = health,
                id = playerId
            })
        end)
    end  
end)
