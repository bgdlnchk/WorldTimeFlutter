import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map cityData = {};
  Color bgColor;
  Color sunOrMoon;

  @override
  void initState() {
    super.initState();
  }

  //Initialize AdMob Banner
  String getBannerId() {
    String bannerValue;
    if (Platform.isAndroid) {
      //Paste your Android AdMob Banner Id here
      bannerValue = 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      //Paste your IOS AdMob Banner Id here
      bannerValue = 'ca-app-pub-3940256099942544/2934735716';
    }
    return bannerValue;
  }

  //Initialize AdMob Banner
  String getInterstitialId() {
    String interstitialValue;
    if (Platform.isAndroid) {
      //Paste your Android AdMob Interstitial Id here
      interstitialValue = 'ca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isIOS) {
      //Paste your IOS AdMob Interstitial Id here
      interstitialValue = 'ca-app-pub-3940256099942544/4411468910';
    }
    return interstitialValue;
  }

  @override
  Widget build(BuildContext context) {
    cityData = cityData.isNotEmpty
        ? cityData
        : ModalRoute.of(context).settings.arguments;
    //Set background color
    bgColor = cityData['isDaytime'] ? Colors.blue : Colors.indigo[700];
    //Add Sun or Moon
    sunOrMoon = cityData['isDaytime'] ? Colors.yellow : Colors.white70;

    //Initialize Interstitial
    AdmobInterstitial interstitialAd =
        AdmobInterstitial(adUnitId: getInterstitialId());
    interstitialAd.load();

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AdmobBanner(
              adUnitId: getBannerId(),
              adSize: AdmobBannerSize.FULL_BANNER,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      if (await interstitialAd.isLoaded) {
                        interstitialAd.show();
                        interstitialAd.load();
                      }
                      dynamic result =
                          await Navigator.pushNamed(context, '/choose_city');
                      if (result != null) {
                        setState(() {
                          cityData = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag'],
                            'country': result['country']
                          };
                        });
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/${cityData['flag']}'),
                      radius: 45.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        cityData['location'],
                        style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    cityData['country'],
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    cityData['offset'],
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 40.0),
                  Text(cityData['time'],
                      style: TextStyle(
                        fontSize: 85.0,
                        color: Colors.white,
                      )),
                  SizedBox(height: 40.0),
                  CircleAvatar(
                    backgroundColor: sunOrMoon,
                    radius: 70.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
