$(document).ready(function(){
  var cityWeatherCache = {};
  // TODO: implement autocomplete

    $("#submit-btn").click(function(e){
      e.preventDefault();
      $("#error").empty();

      var cityName = $("#city_name").val().toLowerCase();
      if(cityName === "") {
        showErrorMessage("City name is empty");
        return
      }

      var data = cityWeatherCache[cityName]
      if(data === undefined) {
        $.get("/weather/" + cityName).done(function(data){
          console.log(data);
          cityWeatherCache[cityName] = data;
          showWeatherInfo(data);
        }).fail(function(data){
          // TODO: format error msg
          showErrorMessage(data.responseText);
        })
      } else {
        showWeatherInfo(data);
      }
    })

    function showErrorMessage(msg) {
      $("#error").text("Error: " + msg);
    }

    function showWeatherInfo(data) {
      var html = '<div class="card-content white-text">';
      html += '<span class="card-title">Weather info for: ' + data.city + '</span>'
      html += '<p><i class="medium material-icons">wb_sunny</i><span>Temperature:</span> ' + data.temperature + '</p>'
      html += '<p><i class="medium material-icons">blur_on</i><span>Humidity:</span>' + data.humidity + '</p>'
      html += '<p><i class="medium material-icons">brightness_low</i><span>MinTemperature:</span>' + data.min_temperature + '</p>'
      html += '<p><i class="medium material-icons">brightness_high</i><span>MaxTemperature:</span>' + data.max_temperature + '</p>'
      html += '<p><i class="medium material-icons">wb_cloudy</i><span>Clouds:</span>' + data.clouds + '</p>'
      html += '<p><i class="medium material-icons">toys</i><span>WindSpeed:</span>' + data.wind_speed + '</p>'
      html += '<p><i class="medium material-icons">trending_up</i><span>WindAngle:</span>' + data.wind_angle + '</p>'
      html += '<p><i class="medium material-icons">leak_add</i><span>Pressure:</span>' + data.pressure + '</p>'
      html += '</div>';
      $("#weather-results .card").html(html);
    }
});
