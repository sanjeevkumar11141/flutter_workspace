import 'package:flutter/material.dart';
import 'package:navigation_using_named_route_flutter_demo/screen/details_screen.dart';
import 'package:navigation_using_named_route_flutter_demo/screen/home_screen.dart';
import 'package:navigation_using_named_route_flutter_demo/navigation/navigation_service.dart';
import 'package:navigation_using_named_route_flutter_demo/navigation/routes_name.dart';
import 'package:navigation_using_named_route_flutter_demo/screen/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final NavigationService _navigationService = NavigationService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
      navigatorKey: _navigationService.navigatorKey,
     // initialRoute: RoutesName.home,
      routes: {
      //  RoutesName.home: (context) => HomeScreen(),
        RoutesName.details: (context) => DetailsScreen(),
        RoutesName.profile : (context) => ProfileScreen(),
      },
    );
  }
}


