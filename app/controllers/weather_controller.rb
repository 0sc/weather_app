class WeatherController < ApplicationController
  def index
  end

  def show
    if params[:city].blank?
      render plain: "City name is empty", status: 400
      return
    end

    begin
      weather = Openweather2.get_weather(city: params[:city])
      render json: weather.to_json
    rescue
      msg = "Couldn't fetch weather info for '#{params[:city]}'. " \
            "Check that input is a valid city name and try again."
      render plain: msg, status: 404
    end
  end
end
