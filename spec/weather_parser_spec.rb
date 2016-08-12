require_relative '../weather_parser'

describe WeatherParser do
  subject do
    WeatherParser.new(weather_json)
  end

  describe '#city' do
    context 'given status code is successful' do
      let(:weather_json) {
        {
          'cod' => '200',
          'name' => 'Gotham City',
        }
      }

      it 'returns the city name' do
        expect(subject.city).to eq('Gotham City')
      end
    end

    context 'given status code is unsuccessful' do
      let(:weather_json) {
        {
          'cod' => '404',
          'name' => 'Atlantis',
        }
      }

      it 'returns nil' do
        expect(subject.city).to be_nil
      end
    end
  end

  describe '#temperature_fahrenheit' do
    context 'given status code is successful' do
      let(:weather_json) {
        {
          'cod' => '200',
          'main' => { 'temp' => '80.60' },
        }
      }

      it 'returns a floating number temperature' do
        expect(subject.temperature_fahrenheit).to eq(80.6)
      end
    end

    context 'given status code is unsuccessful' do
      let(:weather_json) {
        {
          'cod' => '404',
          'main' => { 'temp' => '123.45' },
        }
      }

      it 'returns nil' do
        expect(subject.temperature_fahrenheit).to be_nil
      end
    end
  end

  describe '#error_message' do
    context 'given status code is successful' do
      let(:weather_json) {
        {
          'cod' => '200',
          'message' => 'Everything is running smooth as silk :D',
        }
      }

      it 'returns nil' do
        expect(subject.error_message).to be_nil
      end
    end

    context 'given status code is unsuccessful' do
      let(:weather_json) {
        {
          'cod' => '404',
          'message' => 'No Waldo here :(',
        }
      }

      it 'returns an error message' do
        expect(subject.error_message).
          to eq("Error Code #{ weather_json['cod'] }: #{ weather_json['message'] }")
      end
    end
  end
end
