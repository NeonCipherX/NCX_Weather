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

-- set game weather on event
RegisterNetEvent('NCX_Weather:client:update_weather')
AddEventHandler('NCX_Weather:client:update_weather', function(weather)
	ClearOverrideWeather()
	ClearWeatherTypePersist()
	Wait(100)
	ClearExtraTimecycleModifier()
	ClearTimecycleModifier()
	SetOverrideWeather(weather)
	SetWeatherTypeNow(weather)
	SetWeatherTypeNowPersist(weather)
end)

-- trigger weather event on join
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("NCX_Weather:server:update_weather")
end)