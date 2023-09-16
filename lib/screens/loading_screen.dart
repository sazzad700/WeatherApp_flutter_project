import 'dart:convert';

import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

import '../components/location.dart';
import 'dart:convert';

import 'location_screen.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  @override
  void initState() {
    super.initState();

    getlocData();


  }

  void getlocData() async{

    var weatherData=await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return  LocationScreen(locationWeather: weatherData,);
    }));


  }






    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 100,
          ),
        ),
      );
    }
  }



