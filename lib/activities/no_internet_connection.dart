import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoInternetConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: Icon(Icons.signal_wifi_off, color: Colors.white, size: 90.0),
        )
    );
  }
}
