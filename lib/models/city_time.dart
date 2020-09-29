import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class CityTime {
  String city; // city name
  String time; // time in the city
  String flag; // flag of the country
  String url; // city url from api
  String country;// country of the city
  String offset; // difference from Coordinated Universal Time (UTC)
  bool isDaytime; // boolean for check if is a day or a night in the city

  CityTime({ this.city, this.flag, this.url, this.country, this.offset});

  Future<void> getTime() async {
    try{
      //Make request to the World Time API for getting clicked city information
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //Get city data from JSON
      String datetime = data['datetime'];
      offset = data['utc_offset'];

      //Create DataTime object for making time looking better
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1,3))));
      time = DateFormat.jm().format(now);

      //Check if it's a day in the city or a night
      isDaytime = now.hour > 8 && now.hour < 18 ? true : false;
    }
    catch (e) {
      print(e);
      time = 'Could not get a city time';
    }
  }
}