require 'httparty'
require 'byebug'

class TenDayForecast

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def ten_day_forecast
  forecast = {}
    @response["forecast"]["simpleforecast"]["forecastday"].each do |x|
      dates = x['date']['monthname'].to_s + " " + x['date']['day'].to_s + ", " + x['date']['weekday'].to_s
      forecast[dates] = x["conditions"]
    end
  forecast
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("https://api.wunderground.com/api/#{key}/forecast10day/q/#{@zip_code}.json")
  end

end

#puts "Enter your zip code"
# api = TenDayForecast.new(27612)
#
# # results = api.ten_day_forecast
# # results.each do |x, y|
# #   puts "#{x}: #{y}"
# # end
