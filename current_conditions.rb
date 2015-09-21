require 'httparty'
require 'byebug'

class CurrentConditions
  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def current_temp
    @response["current_observation"]["temp_f"].to_i
  end

  def wind_direction
    @response["current_observation"]["wind_dir"]
  end

  def weather_icon
    @response["current_observation"]["weather"]
  end

  def humidity
    @response["current_observation"]["relative_humidity"]
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("https://api.wunderground.com/api/#{key}/conditions/q/#{@zip_code}.json")
  end
end

puts "Enter a zip code:"
api = CurrentConditions.new(gets.chomp)
puts api.current_temp
puts api.wind_direction
puts api.weather_icon
puts api.humidity
