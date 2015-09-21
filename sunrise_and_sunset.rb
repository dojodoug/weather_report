require 'byebug'
require 'json'

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
    file = File.read('sunrise_and_sunset.json')
    data_hash = JSON.parse(file)
  end

end

# puts "Enter a zip code:"
api = SunriseAndSunset.new(27612)
puts api.sunrise
puts api.sunset
