import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:world_time_app/models/city_time.dart';

class ChooseCity extends StatefulWidget {
  @override
  _ChooseCityState createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  //Add cities to list here. You can find more here http://worldtimeapi.org/timezones
  List<CityTime> citiesList = [
    CityTime(url: 'Europe/Amsterdam', city: 'Amsterdam', flag: 'new_zealand.png', country: 'Netherlands', offset: '+01:00'),
    CityTime(url: 'Europe/Athens', city: 'Athens', flag: 'greece.png', country: 'Athens', offset: '+02:00'),
    CityTime(url: 'Asia/Baghdad', city: 'Baghdad', flag: 'iraq.png', country: 'Iraq', offset: '+03:00'),
    CityTime(url: 'Asia/Baku', city: 'Baku', flag: 'azerbaijan.png', country: 'Azerbaijan', offset: '+04:00'),
    CityTime(url: 'Europe/Berlin', city: 'Berlin', flag: 'germany.png', country: 'Germany', offset: '+01:00'),
    CityTime(url: 'Europe/Bucharest', city: 'Bucharest', flag: 'romania.png', country: 'Romania', offset: '+02:00'),
    CityTime(url: 'Europe/Brussels', city: 'Brussels', flag: 'belgium.png', country: 'Belgium', offset: '+01:00'),
    CityTime(url: 'Europe/Budapest', city: 'Budapest', flag: 'hungary.png', country: 'Hungary', offset: '+01:00'),
    CityTime(url: 'America/Argentina/Buenos_Aires', city: 'Buenos Aires', flag: 'argentina.png', country: 'Argentina', offset: '-03:00'),
    CityTime(url: 'Africa/Cairo', city: 'Cairo', flag: 'egypt.png', country: 'Egypt', offset: '+02:00'),
    CityTime(url: 'Europe/Copenhagen', city: 'Copenhagen', flag: 'denmark.png', country: 'Denmark', offset: '+01:00'),
    CityTime(url: 'America/Chicago', city: 'Chicago', flag: 'usa.png', country: 'USA', offset: '-06:00'),
    CityTime(url: 'Europe/Dublin', city: 'Dublin', flag: 'ireland.png', country: 'Republic of Ireland', offset: '+00:00'),
    CityTime(url: 'Asia/Dubai', city: 'Dubai', flag: 'uae.png', country: 'United Arab Emirates', offset: '+04:00'),
    CityTime(url: 'Europe/Gibraltar', city: 'Gibraltar', flag: 'uk.png', country: 'United Kingdom', offset: '+01:00'),
    CityTime(url: 'Asia/Hong_Kong', city: 'Hong Kong', flag: 'china.png', country: 'China', offset: '+08:00'),
    CityTime(url: 'Europe/Helsinki', city: 'Helsinki', flag: 'finland.png', country: 'Finland', offset: '+02:00'),
    CityTime(url: 'Asia/Irkutsk', city: 'Irkutsk', flag: 'russia.png', country: 'Russia', offset: '+08:00'),
    CityTime(url: 'Asia/Jakarta', city: 'Jakarta', flag: 'indonesia.png', country: 'Indonesia', offset: '+07:00'),
    CityTime(url: 'Asia/Jerusalem', city: 'Jerusalem', flag: 'israel.png', country: 'Israel', offset: '+02:00'),
    CityTime(url: 'America/Jamaica', city: 'Jamaica', flag: 'jamaica.png', country: 'Jamaica', offset: '-05:00'),
    CityTime(url: 'Asia/Kamchatka', city: 'Kamchatka', flag: 'russia.png', country: 'Russia', offset: '+12:00'),
    CityTime(url: 'Asia/Kuala_Lumpur', city: 'Kuala Lumpur', flag: 'malaysia.png', country: 'Malaysia', offset: '+08:00'),
    CityTime(url: 'Europe/Kaliningrad', city: 'Kaliningrad', flag: 'russia.png', country: 'Russia', offset: '+02:00'),
    CityTime(url: 'Europe/Kiev', city: 'Kiev', flag: 'ukraine.png', country: 'Ukraine', offset: '+02:00'),
    CityTime(url: 'America/Los_Angeles', city: 'Los Angeles', flag: 'usa.png', country: 'USA', offset: '-08:00'),
    CityTime(url: 'Europe/London', city: 'London', flag: 'uk.png', country: 'England', offset: '+00:00'),
    CityTime(url: 'Europe/Lisbon', city: 'Lisbon', flag: 'portugal.png', country: 'Portugal', offset: '+00:00'),
    CityTime(url: 'Europe/Madrid', city: 'Madrid', flag: 'spain.png', country: 'Spain', offset: '+01:00'),
    CityTime(url: 'Europe/Moscow', city: 'Moscow', flag: 'russia.png', country: 'Russia', offset: '+03:00'),
    CityTime(url: 'Europe/Minsk', city: 'Minsk', flag: 'belarus.png', country: 'Belarus', offset: '+03:00'),
    CityTime(url: 'Africa/Nairobi', city: 'Nairobi', flag: 'kenya.png', country: 'Kenya', offset: '+03:00'),
    CityTime(url: 'America/New_York', city: 'New York', flag: 'usa.png', country: 'USA', offset: '-05:00'),
    CityTime(url: 'Europe/Oslo', city: 'Oslo', flag: 'norway.png', country: 'Norway', offset: '+01:00'),
    CityTime(url: 'America/Panama', city: 'Panama', flag: 'panama.png', country: 'Panama', offset: '-05:00'),
    CityTime(url: 'Europe/Paris', city: 'Paris', flag: 'france.png', country: 'France', offset: '+01:00'),
    CityTime(url: 'Europe/Prague', city: 'Prague', flag: 'czech_republic.png', country: 'Czech Republic', offset: '+01:00'),
    CityTime(url: 'Pacific/Pohnpei', city: 'Pohnpei', flag: 'micronesia.png', country: 'Micronesia', offset: '+11:00'),
    CityTime(url: 'Europe/Rome', city: 'Rome', flag: 'italy.png', country: 'Italy', offset: '+01:00'),
    CityTime(url: 'Asia/Shanghai', city: 'Shanghai', flag: 'china.png', country: 'China', offset: '+08:00'),
    CityTime(url: 'Asia/Singapore', city: 'Singapore', flag: 'malaysia.png', country: 'Malaysia', offset: '+08:00'),
    CityTime(url: 'Australia/Sydney', city: 'Sydney', flag: 'australia.png', country: 'Australia', offset: '+11:00'),
    CityTime(url: 'Asia/Seoul', city: 'Seoul', flag: 'south_korea.png', country: 'South Korea', offset: '+09:00'),
    CityTime(url: 'Europe/Sofia', city: 'Sofia', flag: 'bulgaria.png', country: 'Bulgaria', offset: '+01:00'),
    CityTime(url: 'Europe/Stockholm', city: 'Stockholm', flag: 'sweden.png', country: 'Sweden', offset: '+01:00'),
    CityTime(url: 'Asia/Tbilisi', city: 'Tbilisi', flag: 'georgia.png', country: 'Georgia', offset: '+04:00'),
    CityTime(url: 'Asia/Tokyo', city: 'Tokyo', flag: 'japan.png', country: 'Japan', offset: '+09:00'),
    CityTime(url: 'Europe/Vienna', city: 'Vienna', flag: 'austria.png', country: 'Austria', offset: '+01:00'),
    CityTime(url: 'America/Vancouver', city: 'Vancouver', flag: 'canada.png', country: 'Canada', offset: '-08:00'),
    CityTime(url: 'Europe/Volgograd', city: 'Volgograd', flag: 'russia.png', country: 'Russia', offset: '+04:00'),
    CityTime(url: 'Europe/Warsaw', city: 'Warsaw', flag: 'poland.png', country: 'Poland', offset: '+01:00'),
    CityTime(url: 'Europe/Zurich', city: 'Zurich', flag: 'switzerland.png', country: 'Switzerland', offset: '+01:00'),
  ];

  //onClickListener for city card
  void showCityInformation(index) async {
    CityTime clickedCity = citiesList[index];
    await clickedCity.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': clickedCity.city,
      'time': clickedCity.time,
      'flag': clickedCity.flag,
      'offset': clickedCity.offset,
      'isDaytime': clickedCity.isDaytime,
      'country': clickedCity.country,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Choose a Location'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: citiesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                child: Card(
                  child: ListTile(
                    onTap: () async {
                      showCityInformation(index);
                      Fluttertoast.showToast(
                          msg: 'The information is loading',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1
                      );
                    },
                    title: Text(
                      citiesList[index].city,
                      style: new TextStyle(
                        fontSize: 20.0
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${citiesList[index].flag}'),
                    ),
                    subtitle: Text(
                      citiesList[index].country,
                      style: new TextStyle(
                        fontSize: 15.0
                      ),
                    ),
                    trailing: Text(
                      citiesList[index].offset,
                      style: new TextStyle(
                          fontSize: 17.0,
                        fontStyle: FontStyle.italic
                      )
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
