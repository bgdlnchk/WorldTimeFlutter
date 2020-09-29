import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/activities/home.dart';
import 'package:world_time_app/activities//loading.dart';
import 'package:world_time_app/activities/choose_city.dart';
import 'package:world_time_app/activities/no_internet_connection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize(getAppId());
  runApp(MaterialApp(
      //Show 'Loading page at start'
      initialRoute: '/loading',
      //Initialize routes names for other pages
      routes: {
        '/home': (context) => Home(),
        '/choose_city': (context) => ChooseCity(),
        '/loading': (context) => Loading(),
        '/no_internet_connection': (context) => NoInternetConnection(),
      }));
}

String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-1929621408598766~1248607455';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-1929621408598766~1248607455';
  }
  return null;
}
