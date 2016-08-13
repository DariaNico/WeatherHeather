require 'http'
require 'json'

class OpenWeatherMapRequester
  def initialize(location_string)
    @location_string = location_string
  end

  def weather_request
    response = HTTP.get(url)

    if response.code != 200
      raise "Bad request: code #{response.code}"
    end

    JSON.parse(response.to_s)
  end

  private

  attr_reader :location_string

  def api_key
    ENV['OPENWEATHERMAP_API_TOKEN']
  end

  def url
    "http://api.openweathermap.org/data/2.5/weather?q=#{ location_string }&APPID=#{ api_key }&units=imperial".
      split(' ').
      join('%20')
  end
end
