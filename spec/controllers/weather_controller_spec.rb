require "rails_helper"

RSpec.describe WeatherController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("weather/index");
    end
  end

  describe "GET show" do
    context "city name is empty" do
      it "returns an error" do
        get :show, params: { city: "" }
        expect(response.status).to be 400
        expect(response.body).to eq "invalid entry for city"
      end
    end

    context "city name is present" do
      it "returns the weather information for the city" do
        sample_response = { "weather" => "info" }
        allow(Openweather2).to receive(:get_weather).and_return(sample_response)
        get :show, params: { city: "San Francisco" }
        expect(response.status).to be 200
        expect(JSON.parse(response.body)).to eq sample_response
      end
    end
  end
end
