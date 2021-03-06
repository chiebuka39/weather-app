import 'package:chat/ui/Weather.dart';
import 'package:flutter/material.dart';
import 'package:chat/model/WeatherData.dart';
import 'package:chat/api/MapApi.dart';
import 'package:chat/api/LocationApi.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WeatherData _weatherData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
   
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: _weatherData != null ? Weather(weatherData: _weatherData) :
          Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          )
      );
  }

  getCurrentLocation() async{
    LocationApi locationApi = LocationApi.getInstance();
    final location =await locationApi.getLocation();
    loadWeather(lat: location.lat, lon: location.lon);
  }

  loadWeather({double lat, double lon}) async {
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat,lon: lon);

    setState(() {
      this._weatherData = data;
    });
  }
}
