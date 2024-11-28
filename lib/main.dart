import 'package:flutter/material.dart';
import 'package:superrewards/utils/navigation_helper.dart';
import 'package:superrewards/utils/resources.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: strAppName,
      theme: appTheme,
      initialRoute: splashScreen,
      routes: routes,
    );
  }
}
