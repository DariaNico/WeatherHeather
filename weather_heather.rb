require './weather_parser'
require './open_weather_map_requester'

puts "Hiya, Heather here! I can tell you your current weather."
puts "First thing's first, where are you?"
puts "(For the best result, please tell me your city and state/country)"
puts "(eg. 'Springfield, IL')"
location_string = $stdin.gets.chomp

weather_requester = OpenWeatherMapRequester.new(location_string)
weather_parser = WeatherParser.new(weather_requester.weather_request)

if weather_parser.error_message.nil?
  puts "Currently, #{ weather_parser.city }'s weather is:"
  puts "#{ weather_parser.temperature_fahrenheit } degrees Fahrenheit"
else
  puts "Oh no! Looks like there was a problem."
  puts "[#{ weather_parser }]"
end

puts "Hope that was helpful, see ya!"
