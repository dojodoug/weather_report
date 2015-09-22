require './current_conditions'
require './10day'
require './sunrise_and_sunset'
require './alerts'
require 'json'

### PROMPT TO START THE WEATHER REPORT ###
puts "To view your current weather conditions please enter a zip code:"
x = gets.chomp
puts

api = CurrentConditions.new(x)
puts "Current weather conditions:"
puts "The current tempurature is: #{api.current_temp}" + " °F"
puts "The current wind direction is: #{api.wind_direction}"
puts "The current weather condition is: #{api.weather_icon}"
puts "The current humidity is: #{api.humidity}"
puts

puts "Your 10 day forecast is:"
api = TenDayForecast.new(x)
results = api.ten_day_forecast
results.each do |x, y|
  puts "#{x}: #{y}"
end
puts

puts "Sunrise for tomorrow will be at:"
api = SunriseAndSunset.new(x)
puts api.sunrise
puts
puts "Sunset will be at:"
puts api.sunset
puts

api = Alerts.new(x)
puts "Current weather alerts:"
puts api.weather_alert
puts
