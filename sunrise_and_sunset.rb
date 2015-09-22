require 'httparty'
require 'byebug'

class SunriseAndSunset

  def initialize(zip_code)
    @zip_code = zip_code
    @response = get_response
  end

  def sunrise
    @response["moon_phase"]["sunrise"]["hour"] + ":" + @response["moon_phase"]["sunrise"]["minute"] + " a.m."
  end

  def sunset
    @response["moon_phase"]["sunset"]["hour"] + ":" + @response["moon_phase"]["sunset"]["minute"] + " p.m."
  end

  private def get_response

    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("https://api.wunderground.com/api/#{key}/astronomy/q/#{@zip_code}.json")
  end

end

# puts "Enter a zip code:"
api = SunriseAndSunset.new(27612)
puts api.sunrise
puts api.sunset
