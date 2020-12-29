import 'package:awecon/views/control_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AWECON',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => ControlPage(),
      },
    );
  }
}
