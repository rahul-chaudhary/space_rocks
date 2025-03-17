import 'package:flutter/material.dart';
import 'package:space_rocks/screens/home_screen.dart';
import 'package:space_rocks/screens/rocket_details_screen.dart';
import 'package:space_rocks/utils/constants/app_routes.dart';

import 'models/rocket_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.rocketsListScreen,
      routes: {
        AppRoutes.rocketsListScreen: (context) => const RocketListScreen(),
      },
    );
  }
}