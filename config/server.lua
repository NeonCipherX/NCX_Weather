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

local weather_location = "London"
local weather_api_key = "" -- weatherapi.com API key
local weather_url = "http://api.weatherapi.com/v1/current.json?key=" .. weather_api_key ..  "&q=" .. weather_location .. "&aqi=no"
local weather_timer_minutes = 60

return {
    weather_timer = weather_timer_minutes * 60 * 1000,
    weather_api = weather_url,
    condition_mapping = {
        {"Clear", "CLEAR"},
        { "Sunny", "CLEAR" },
        { "Partly cloudy", "CLOUDS" },
        { "Cloudy", "CLOUDS" },
        { "Overcast", "CLOUDS" },
        { "Mist", "FOGGY" },
        { "Patchy rain possible", "RAIN" },
        { "Patchy rain nearby", "RAIN" },
        { "Patchy snow possible", "SNOW" },
        { "Patchy sleet possible", "SNOW" },
        { "Patchy freezing drizzle possible", "SNOWLIGHT" },
        { "Thundery outbreaks possible", "THUNDER" },
        { "Blowing snow", "SNOW" },
        { "Blizzard", "SNOW" },
        { "Fog", "FOGGY" },
        { "Freezing fog", "FROZEN" },
        { "Patchy light drizzle", "RAIN" },
        { "Light drizzle", "RAIN" },
        { "Freezing drizzle", "SNOWLIGHT" },
        { "Heavy freezing drizzle", "SNOWLIGHT" },
        { "Patchy light rain", "RAIN" },
        { "Light rain", "RAIN" },
        { "Moderate rain at times", "RAIN" },
        { "Moderate rain", "RAIN" },
        { "Heavy rain at times", "RAIN" },
        { "Heavy rain", "RAIN" },
        { "Light freezing rain", "SNOWLIGHT" },
        { "Moderate or heavy freezing rain", "SNOWLIGHT" },
        { "Light sleet", "SNOW" },
        { "Moderate or heavy sleet", "SNOW" },
        { "Patchy light snow", "SNOW" },
        { "Light snow", "SNOW" },
        { "Patchy moderate snow", "SNOW" },
        { "Moderate snow", "SNOW" },
        { "Patchy heavy snow", "SNOW" },
        { "Heavy snow", "SNOW" },
        { "Ice pellets", "SNOWLIGHT" },
        { "Light rain shower", "RAIN" },
        { "Moderate or heavy rain shower", "RAIN" },
        { "Torrential rain shower", "RAIN" },
        { "Light sleet showers", "SNOW" },
        { "Moderate or heavy sleet showers", "SNOW" },
        { "Light snow showers", "SNOW" },
        { "Moderate or heavy snow showers", "SNOW" },
        { "Light showers of ice pellets", "SNOWLIGHT" },
        { "Moderate or heavy showers of ice pellets", "SNOWLIGHT" },
        { "Patchy light rain with thunder", "THUNDER" },
        { "Moderate or heavy rain with thunder", "THUNDER" },
        { "Patchy light snow with thunder", "SNOW" },
        { "Moderate or heavy snow with thunder", "SNOW" },
        { "Light showers of ice pellets with thunder", "THUNDER" },
        { "Moderate or heavy showers of ice pellets with thunder", "THUNDER" },
    }
}