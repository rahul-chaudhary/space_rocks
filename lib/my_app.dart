import 'package:flutter/material.dart';
import 'package:space_rocks/screens/home_screen.dart';
import 'package:space_rocks/utils/constants/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (context) => const HomeScreen(),
      },
    );
  }
}