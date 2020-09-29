import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Check Internet connection here
  void checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none){
      print('Emulator do not have Internet connection');
      //Show 'No Internet Connection' page
      Navigator.pushReplacementNamed(context, '/no_internet_connection');
    } else if (result == ConnectivityResult.mobile){
      print('Emulator uses mobile data');
      //Show 'Choose City' page
      Navigator.pushReplacementNamed(context, '/choose_city');
    } else if (result == ConnectivityResult.wifi){
      print('Emulator uses Wifi');
      //Show 'Choose City' page
      Navigator.pushReplacementNamed(context, '/choose_city');
    }
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  //Initialize AdMob
  void initializeAdMob() {
    if (Platform.isAndroid) {
      //Paste your Android AdMob Publisher Id here
      Admob.initialize('ca-app-pub-2481550376243942~1144427022');
    } else if (Platform.isIOS) {
      //Paste your IOS AdMob Publisher Id here
      Admob.initialize('ca-app-pub-2481550376243942~9512859874');
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeAdMob();
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}

