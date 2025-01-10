import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_networking_response_exception_handling/ui/product_screen.dart';

import 'config/flavor_config.dart';
import 'models/product.dart';

void main() {
  FlavorConfig.setupFlavor(Flavor.DEV);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ProductScreen(productId: "20",),
    );
  }
}

Product parseJsonData() {
  const jsonString = '''{
      "id": 1,
      "title": "Change title",
      "price": 100,
      "description": "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
      "images": ["https://placeimg.com/640/480/any"],
      "creationAt": "2023-01-03T15:58:58.000Z",
      "updatedAt": "2023-01-03T16:54:02.000Z",
      "category": {
        "id": 4,
        "name": "Shoes",
        "image": "https://api.lorem.space/image/shoes?w=640&h=480&r=4508",
        "creationAt": "2023-01-03T15:58:58.000Z",
        "updatedAt": "2023-01-03T15:58:58.000Z"
      }
    }''';

  final jsonData = json.decode(jsonString);
  return Product.fromJson(jsonData);
}

