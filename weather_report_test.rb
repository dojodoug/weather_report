require 'minitest/autorun'
require 'minitest/pride'
require './current_conditions'
require 'json'

class CurrentConditionsTest < Minitest::Test

  def test_current_temp
    assert_equal 77, CurrentConditions.new(27612).current_temp
  end

  def test_wind_direction
    assert_equal "ESE", CurrentConditions.new(27612).wind_direction
  end

  def test_weather_icon
    assert_equal "Overcast", CurrentConditions.new(27612).weather_icon
  end

  def test_humidity
    assert_equal "66%", CurrentConditions.new(27612).humidity
  end

end
