require "rails_helper"

RSpec.describe "weather/index.html.erb", type: :view do
  before(:each) { render }

  it "displays the page heading text" do
    scoped = page.find("h5.header")
    expect(scoped).to have_content("Check weather update for any city")
  end

  it "displays field to input city name" do
    expect(page).to have_field("city_name")
  end

  it "displays the input submit button" do
    expect(page).to have_css("#submit-btn")
  end
end
