import 'package:covidapp/views/countries_detail.dart';
import 'package:covidapp/views/countries_list.dart';
import 'package:covidapp/views/splash_screen.dart';
import 'package:covidapp/views/world_states.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      // home: const WorldStatesScreen(),
      // home: const CountriesListScreen(),
    );
  }
}
