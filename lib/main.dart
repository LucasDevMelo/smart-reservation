import 'package:flutter/material.dart';
import 'package:healthcare/models/all_restaurants.dart';
import 'package:healthcare/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:healthcare/screens/welcome_screen.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => AllRestaurants(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  WelcomeScreen(),
      routes: {
        '/welcomescreen': (context) =>  WelcomeScreen(),
        '/homescreen': (context) =>  const HomeScreen(),
      },
    );
  }
}
