require 'minitest/autorun'
require 'minitest/pride'
require './current_conditions'
require './10day'
require './sunrise_and_sunset'
require 'json'

class WeatherReportTest < Minitest::Test

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

  def test_10_day_forecast

    a = {"September 21, Monday" => "Chance of a Thunderstorm",
    "September 22, Tuesday" => "Mostly Cloudy",
    "September 23, Wednesday" => "Mostly Cloudy",
    "September 24, Thursday" => "Chance of Rain",
    "September 25, Friday" => "Rain",
    "September 26, Saturday" => "Rain",
    "September 27, Sunday" => "Rain",
    "September 28, Monday" => "Clear",
    "September 29, Tuesday" => "Clear",
    "September 30, Wednesday" => "Clear"}
    assert_equal a, TenDayForecast.new(27612).ten_day_forecast
  end

  def test_sunrise_and_sunset
    assert_equal "7:01 a.m.", SunriseAndSunset.new(27612).sunrise
    assert_equal "19:13 p.m.", SunriseAndSunset.new(27612).sunset
  end

end
