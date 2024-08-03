--[[
    ███╗   ██╗███████╗ ██████╗ ███╗   ██╗ ██████╗██╗██████╗ ██╗  ██╗███████╗██████╗ ██╗  ██╗
    ████╗  ██║██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔══██╗██║  ██║██╔════╝██╔══██╗╚██╗██╔╝
    ██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██║     ██║██████╔╝███████║█████╗  ██████╔╝ ╚███╔╝ 
    ██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║██║     ██║██╔═══╝ ██╔══██║██╔══╝  ██╔══██╗ ██╔██╗ 
    ██║ ╚████║███████╗╚██████╔╝██║ ╚████║╚██████╗██║██║     ██║  ██║███████╗██║  ██║██╔╝ ██╗
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
            
    Name: NCX_Weather
    Author: NeonCipherX
    Version: 1.1
    - added state management
]]

-- set game weather on event
RegisterNetEvent('NCX_Weather:client:update_weather')
AddEventHandler('NCX_Weather:client:update_weather', function()
	ClearOverrideWeather()
	ClearWeatherTypePersist()
	Wait(100)
	ClearExtraTimecycleModifier()
	ClearTimecycleModifier()
	SetOverrideWeather(GlobalState.current_weather)
	SetWeatherTypeNow(GlobalState.current_weather)
	SetWeatherTypeNowPersist(GlobalState.current_weather)
end)

-- trigger weather event on join
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("NCX_Weather:server:update_weather")
end)