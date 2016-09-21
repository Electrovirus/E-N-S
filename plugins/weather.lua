local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

local function get_weather(location)
  print("Finding weather in ", location)
  local url = BASE_URL
  url = url..'?q='..location..'&APPID=eedbc05ba060c787ab0614cad1f2e12b'
  url = url..'&units=metric'

  local b, c, h = http.request(url)
  if c ~= 200 then return nil end

  local weather = json:decode(b)
  local city = weather.name
  local country = weather.sys.country
  local temp = '🌅Temperature of '..city..' is now '..weather.main.temp..' degree  \n '
  local conditions = '🌄Local air conditions : '

  if weather.weather[1].main == 'Clear' then
    conditions = conditions .. 'Sunny ☀'
  elseif weather.weather[1].main == 'Clouds' then
    conditions = conditions .. 'Cloudy ☁☁'
  elseif weather.weather[1].main == 'Rain' then
    conditions = conditions .. 'Rainy ☔'
  elseif weather.weather[1].main == 'Thunderstorm' then
    conditions = conditions .. 'Thunderstorm ☔☔☔☔'
  elseif weather.weather[1].main == 'Mist' then
    conditions = conditions .. 'Fogy 💨'
  end

  return temp .. '\n' .. conditions
end
local function run(msg, matches) 
    city = matches[1]
  local wtext = get_weather(city)
  if not wtext then
    wtext = '❎The place you entered is not correct'
  end
  return wtext
end

return {

  patterns = {
   "^[/!#][Ww]eather (.*)$",
    },
  run = run
}
