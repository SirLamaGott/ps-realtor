RegisterNetEvent("rlo_realtor:server:updateProperty", function(type, property_id, data)
    -- Job check
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayerJob = xPlayer.getJob()
    if not RealtorJobs[xPlayerJob.name] then return false end

    data.realtorSrc = src
    -- Update property
    TriggerEvent("rlo_housing:server:updateProperty", type, property_id, data)
end)

RegisterNetEvent("rlo_realtor:server:registerProperty", function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayerJob = xPlayer.getJob()
    if not RealtorJobs[xPlayerJob.name] then return false end

    data.realtorSrc = src
    return exports['rlo_housing']:registerProperty(data, nil, src)
end)

RegisterNetEvent("rlo_realtor:server:addTenantToApartment", function(data)
    -- Job check
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayerJob = xPlayer.getJob()
    if not RealtorJobs[xPlayerJob.name] then return false end

    data.realtorSrc = src
    -- Add tenant
    TriggerEvent("rlo_housing:server:addTenantToApartment", data)
end)

lib.callback.register("rlo_realtor:server:getNames", function (source, data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayerJob = xPlayer.getJob()
    if not RealtorJobs[xPlayerJob.name] then return false end
    
    local names = {}
    for i = 1, #data do
        local target = ESX.GetPlayerFromIdentifier(data[i])
        if target then
            names[#names+1] = target.getName()
        else
            names[#names+1] = 'Unbekannt'
        end
    end
    
    return names
end)