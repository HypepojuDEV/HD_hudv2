ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('esx:getPlayerData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then  
        cb({
            money = xPlayer.getAccount('bank').money,  -- Pankkitilin saldo
            wallet = xPlayer.getMoney(),  -- Käteinen
            job = xPlayer.getJob()
        })
    else  
        cb(nil)
    end  
end)
