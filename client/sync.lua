local RLOHousing = exports['rlo_housing']

local function initialiseData()
	-- Get properties
	local properties = RLOHousing:GetProperties()

	PropertiesTable = {}
	for _, property in pairs(properties) do
		PropertiesTable[#PropertiesTable+1] = property.propertyData
	end

	local apartments = RLOHousing:GetApartments()

	local ApartmentsTable = {}

	for _, apartment in pairs(apartments) do
		ApartmentsTable[#ApartmentsTable+1] = apartment
	end

	lib.waitFor(function()
		if UiLoaded then return true end
	end, 'ui loading timeout', 5000)

	SendNUIMessage({
		action = "setShells",
		data = exports['rlo_housing']:GetShells()
	})

	SendNUIMessage({
		action = "setProperties",
		data = PropertiesTable
	})

	SendNUIMessage({
		action = "setApartments",
		data = ApartmentsTable
	})
end

CreateThread(function()
	if GetResourceState('rlo_housing') ~= 'started' then return end
	initialiseData()
end)

AddEventHandler('rlo_housing:client:initialisedProperties', initialiseData)

AddEventHandler('rlo_housing:client:updatedProperty', function(property_id)
	local property = exports['rlo_housing']:GetProperty(property_id)

	for i = 1, #PropertiesTable do
		if PropertiesTable[i].property_id == property_id then
			PropertiesTable[i] = property.propertyData
			break
		end
	end

	SendNUIMessage({
		action = "updateProperty",
		data = property.propertyData
	})
end)

--old is the old player apartment location, new is the new location
-- both have to be updated
AddEventHandler("rlo_housing:client:updateApartment", function(old, new)

	local oldApt = RLOHousing:GetApartment(old)

	SendNUIMessage({
		action = "updateApartment",
		data = oldApt
	})

	local newApt = RLOHousing:GetApartment(new)

	SendNUIMessage({
		action = "updateApartment",
		data = newApt
	})
end)

RegisterNetEvent('rlo_housing:client:addProperty', function(propertyData)
	PropertiesTable[#PropertiesTable+1] = propertyData

	SendNUIMessage({
		action = "updateProperty", -- if it cant find the property it will add it
		data = propertyData
	})
end)
