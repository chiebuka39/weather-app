import 'package:chat/model/WeatherData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {

  final WeatherData weatherData;
  Weather({@required this.weatherData});

  @override
  Widget build(BuildContext context) {

    Widget dataSection = Container(
      child: Text(
        DateFormat('MMMM d, H:mm').format(DateTime.now()),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );

    Widget tempSection = Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            weatherData.temp.toStringAsFixed(0),
            style: TextStyle(
              fontSize: 80.0,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top:12.0,
              ),
              margin: EdgeInsets.only(
                left: 6.0,
              ),
              child: Text(
                '\u2103',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Image.network(
            'https://openweathermap.org/img/w/${weatherData.icon}.png',
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );

    Widget descriptionSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            weatherData.name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            weatherData.main,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      )
    );

    return Container(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dataSection,
          tempSection,
          descriptionSection
        ],
      ),
    );
  }
}