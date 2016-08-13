# WeatherHeather
  Meet Heather!

  Heather is a friendly rails anchorapp who uses OpenWeatherMap's API to get you the current temperature of your city :D.

## Setup/How To
  You will need to do a few things before Heather can sucessfully help you:

  1) Make sure to bundle and all that (we wouldn't want and missing gems be the cause of failure)!
  
  2) Since WeatherHeather uses the OpenWeatherMap API and I'm not about to let you use my account, you will need to go to [OpenWeatherMap](http://openweathermap.org/price) and go sign up and get yourself an API key. Don't worry, there's a free option so all is well.

  3) Using your shiny new **API Key**, let's set it as our local environment variable, under the key of ```'OPENWEATHERMAP_API_TOKEN'```. [Here are some ways to do it](http://railsapps.github.io/rails-environment-variables.html). And [here is more info on ENV variables](http://blog.honeybadger.io/ruby-guide-environment-variables/).
    * Use [Figaro](https://github.com/laserlemon/figaro)
      - Run ```$ bundle exec figaro install```, which will create a commented ```config/application.yml``` and add it to your ```.gitignore```
      - Add ```OPENWEATHERMAP_API_TOKEN: "API Key here"``` to ```confic/application.ym;```. This will add it to your local ENV variables for Heather to access.
    * In your terminal, run ```export OPENWEATHERMAP_API_TOKEN="API Key here"``` to set it for the current window.

  4) Heather is now ready to help you! Run the program ```weather_heather.rb``` to get your weather information. (NOTE: If you're running from a shell, remember to make the ```weather_heather.rb``` and executeable with chmod!)

## Warnings and Shinanigans
  Heather is not the brightest and is limited to what her friend's (OpenWeatherMap) query abilities are and their database completeness. As such, you might not get the correct city's weather or you might get a very unexpected answer if you're imputting mischevious locations! You have been warned.

## About
  WeatherHeather was programmed by me, DariaNico, as a coding exercise. It came from [Brian P. Hogan. Exercises for Programmers, P1.0 The Pragmatic Bookshelf, LLC.](https://pragprog.com/book/bhwb/exercises-for-programmers).
