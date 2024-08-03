--[[
    ███╗   ██╗███████╗ ██████╗ ███╗   ██╗ ██████╗██╗██████╗ ██╗  ██╗███████╗██████╗ ██╗  ██╗
    ████╗  ██║██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔══██╗██║  ██║██╔════╝██╔══██╗╚██╗██╔╝
    ██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██║     ██║██████╔╝███████║█████╗  ██████╔╝ ╚███╔╝ 
    ██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║██║     ██║██╔═══╝ ██╔══██║██╔══╝  ██╔══██╗ ██╔██╗ 
    ██║ ╚████║███████╗╚██████╔╝██║ ╚████║╚██████╗██║██║     ██║  ██║███████╗██║  ██║██╔╝ ██╗
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
            
    Name: NCX_Weather
    Author: NeonCipherX
    Version: 1.0
]]

local config = require 'config.server'

local weather_initialized = false

local function get_gta_equivalent(condition)
    for _, mapping in ipairs(config.condition_mapping) do
        local pattern = mapping[1]
        if string.find(condition, pattern) then
            return mapping[2]
        end
    end
	print(
		"WARNING: No weather condition mapping found for: " .. condition .. " please add to the config."
	)
    return nil
end

function get_weather(callback)
    PerformHttpRequest(config.weather_api, function (errorCode, resultData, resultHeaders, errorData)
        local data = json.decode(resultData)
        local condition_text = data.current.condition.text
        local gta_equivalent = get_gta_equivalent(condition_text)
		print(condition_text .. " -> " .. gta_equivalent)
        callback(gta_equivalent)
    end)
end

RegisterNetEvent('NCX_Weather:server:update_weather')
AddEventHandler('NCX_Weather:server:update_weather', function()
    get_weather(function(gta_equivalent)
        TriggerClientEvent('NCX_Weather:client:update_weather', -1, gta_equivalent)
    end)
end)

AddEventHandler('playerConnecting', function()
	local src = source
	get_weather(function(gta_equivalent)
        TriggerClientEvent('NCX_Weather:client:update_weather', src, gta_equivalent)
    end)
end)

CreateThread(function()
	if not weather_initialized then
        weather_initialized = true
        TriggerEvent('NCX_Weather:server:update_weather')
    end

	while true do
		Wait(config.weather_timer)
		TriggerEvent('NCX_Weather:server:update_weather')
	end
end)