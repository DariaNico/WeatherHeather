require_relative '../open_weather_map_requester'

describe OpenWeatherMapRequester do
  subject do
    OpenWeatherMapRequester.new(location_string)
  end

  describe "ENV['OPENWEATHERMAP_API_TOKEN']" do
    it 'should be set and not nil' do
      expect(ENV['OPENWEATHERMAP_API_TOKEN'].nil?).to be_falsey
    end
  end

  describe '#weather_request' do
    context 'city name and country/state code' do
      context 'given a valid city and valid country/state code' do
        let(:location_string) { 'tokyo jp' }

        it 'returns a 200 with correct city/weather info' do
          sleep 0.5 # NOTE: need to wait before running request otherwise it will fail
          expect(subject.weather_request['cod'].to_i).to eq(200)
        end
      end

      context 'given a valid city and invalid country/state code' do
        let(:location_string) { 'beijing panda' }

        it 'returns a 200 with incorrect city/weather info' do
          sleep 0.5 # NOTE: need to wait before running request otherwise it will fail
          expect(subject.weather_request['cod'].to_i).to eq(200)
        end
      end

      context 'given an invalid city and valid country/state code' do
        let(:location_string) { 'batmanisawesometastic us' }

        it 'returns a 404' do
          sleep 0.5 # NOTE: need to wait before running request otherwise it will fail
          expect(subject.weather_request['cod'].to_i).to eq(404)
        end
      end

      context 'given an invalid city and invalid country/state code' do
        let(:location_string) { 'whatisyourfavoritecolor turquoise' }

        it 'returns a 404' do
          sleep 0.5 # NOTE: need to wait before running request otherwise it will fail
          expect(subject.weather_request['cod'].to_i).to eq(404)
        end
      end

      context 'given nothing' do
        let(:location_string) { nil }

        it 'returns a 404' do
          sleep 0.5 # NOTE: need to wait before running request otherwise it will fail
          expect(subject.weather_request['cod'].to_i).to eq(404)
        end
      end
    end
  end
end
