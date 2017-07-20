require "rails_helper"

feature "checking_weather_info" do
  before(:each) do
    allow(Openweather2).to receive(:get_weather).and_return(mock_weather_info)
    visit root_path
  end

  it "displays the weather info for the entered city name", js: true do
    fill_in("city_name", with: "some-city_name")
    find("#submit-btn").click

    within ".card-content" do
      mock_weather_info.values.each do |val|
        expect(page).to have_content val
      end
    end
  end

  it "displays an error if no city name is entered", js: true do
    find("#submit-btn").click
    expect(page.find("#error")).to have_content("Error: City name is empty")
    expect(page.find("#weather-results .card").text).to be_empty
  end

  it "displays an error if fetching weather info was unsuccessful", js: true do
    allow(Openweather2).to receive(:get_weather).and_raise("Fake Error")

    fill_in("city_name", with: "some-city_name")
    find("#submit-btn").click
    expect(page.find("#error")).to have_content(
      "Couldn't fetch weather info for 'some-city_name'. "\
      "Check that input is a valid city name and try again."
    )
    expect(page.find("#weather-results .card").text).to be_empty
  end

  def mock_weather_info
    {
      city: "some-city_name",
      temperature: 287.42,
      pressure: 1017,
      wind_angle: 320,
      wind_speed: 2.1,
      max_temperature: 289.15,
      min_temperature: 284.15,
      clouds: 90,
      humidity: 93
    }
  end
end
