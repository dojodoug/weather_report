require 'httparty'
require 'byebug'


class Alerts

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def weather_alert
  alert = {}
    if @response["alerts"].empty?
      return "There are currently no weather alerts in your area."
    else
      @response["alerts"].each do |x|
        alert = x["description"]
      end
    end
    alert
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("https://api.wunderground.com/api/#{key}/alerts/q/#{@zip_code}.json")
  end
end

api = Alerts.new(85701)
puts api.weather_alert
