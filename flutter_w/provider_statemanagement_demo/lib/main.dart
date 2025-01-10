import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement_demo/provider/auth_provider.dart';
import 'package:provider_statemanagement_demo/provider/counter_provider.dart';
import 'package:provider_statemanagement_demo/provider/dark_theame_provider.dart';
import 'package:provider_statemanagement_demo/provider/favourite_provider.dart';
import 'package:provider_statemanagement_demo/screen/counter_screen.dart';
import 'package:provider_statemanagement_demo/screen/dark_theame_screen.dart';
import 'package:provider_statemanagement_demo/screen/favourite_screen.dart';
import 'package:provider_statemanagement_demo/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      // return ChangeNotifierProvider(
      //   create: (context) => CounterProvider(),
      //   child: MaterialApp(
      //     title: 'Flutter Demo',
      //     theme: ThemeData(
      //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //       useMaterial3: true,
      //     ),
      //  //   home: CounterScreen(),
      //     home: FavouriteScreen(),
      //   ));


    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          ChangeNotifierProvider(create: (context) => FavouriteProvider()),
          ChangeNotifierProvider(create: (context) => DarkTheameProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        child: Builder(
          builder: (context) {
            final themeProvider = Provider.of<DarkTheameProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: themeProvider.themeMode,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                  brightness: Brightness.dark, // Ensure brightness is set to dark
                ),
                useMaterial3: true,
              ),
              home: LoginScreen(),
            );
          },
        ));
  }
}
