# Weather App

This is a simple weather app to display the current weather in any given city. It leverages [OpenWeatherMap](https://openweathermap.org/) to retrieve the weather information for the given city name.

## Installation
Weather app is built with **Ruby** version `2.4.1` and as such you would need to have [ruby setup](https://www.ruby-lang.org/en/downloads/) to use it.

With Ruby installed, [clone the repo](git@github.com:andela-ooranagwa/weather_app.git) and `cd` into the `weather_app` folder.

Install the app dependencies by running:
```
bundle install
```

_if you don't have bundler installed, first run `gem install bundler`_

You'll also need an **OPEN_API_KEY** to use. Visit https://openweathermap.org, create a free account and copy you **OPEN_API_KEY** from the *API_KEYS* sections in your account page.
To make the key available in the app environment run
```bash
echo "OPEN_API_KEY=[your_key_here]" > .env
```
or export the key from your command line.

Start the app
```bash
rails server
```

Visit `localhost:3000` in your browser to view the app.

## How to run the test suite

```bash
bundle exec rspec spec
```

## Todos
- [ ] Implement autocomplete for city name input to reduce possibility of errors
- [ ] Expand input options to leverage OpenWeatherMap search by zipcode, coordinates etc
- [ ] Improve caching implementation
- [ ] Improve UI
- [ ] Restrict access to show_action to only ajax request

# License

The app is available as open source under the terms of the MIT License.
