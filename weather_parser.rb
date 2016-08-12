class WeatherParser
  def initialize(weather_json)
    @weather_json = weather_json
  end

  def city
    weather_json['name'] if successful?
  end

  def temperature_fahrenheit
    weather_json['main']['temp'].to_f if successful?
  end

  def error_message
    "Error Code #{ status_code }: #{ weather_json['message'] }" unless successful?
  end

  private

  attr_reader :weather_json

  def status_code
    weather_json['cod'].to_i
  end

  def successful?
    status_code == 200
  end
end
