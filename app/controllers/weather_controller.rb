class WeatherController < ApplicationController
  def index
  end

  def show
    if params[:city].blank?
      render plain: "invalid entry for city", status: 400
      return
    end

    weather = Openweather2.get_weather(city: params[:city])
    render json: weather.to_json
  end
end
