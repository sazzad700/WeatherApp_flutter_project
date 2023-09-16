import '../components/location.dart';
import 'networking.dart';
const apikey='e60c98af58f3563d8e9f5642845d6a51';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future getLocationWeather() async{

    Location location=Location();

    await location.getLocation();


    print('this  is randy');
    networkHelper netwh=networkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longtitude}&appid=$apikey&units=metric');


    var weatherData=await netwh.getData();
    return weatherData;
  }

  Future getcityWeather(String cityname) async{
    networkHelper netwh=networkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric');
    var weatherData=await netwh.getData();
    return weatherData;
  }

}
