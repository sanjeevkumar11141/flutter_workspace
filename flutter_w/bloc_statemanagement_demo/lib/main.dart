import 'package:bloc_statemanagement_demo/cubit_demo/screen/my_counter_app.dart';
import 'package:bloc_statemanagement_demo/repository/product_repository.dart';
import 'package:bloc_statemanagement_demo/screen/button_screen.dart';
import 'package:bloc_statemanagement_demo/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.blue, // Set your default status bar color here
    statusBarIconBrightness: Brightness.light, // Adjust icon color if needed
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ButtonScreen(),
        routes: {
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
