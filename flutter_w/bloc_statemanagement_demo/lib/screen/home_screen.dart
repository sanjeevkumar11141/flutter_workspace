import 'package:bloc_statemanagement_demo/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../repository/product_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  //Here, BlocProvider makes the ProductBloc available to ProductScreen and any of its descendant widgets.
                    builder: (context) => BlocProvider(
                          create: (context) => ProductBloc(ProductRepository()),
                          child: ProductScreen(),
                        )));
          },
          child: const Text("Show Product List",
              style: TextStyle(color: Colors.blue, fontSize: 22)),
        ),
      ),
    );
  }
}

// Key Points:
// Provides an instance of a BLoC or Cubit to its descendants.
// Automatically disposes of the BLoC/Cubit when it is no longer needed (when the widget tree is removed).
// Can be used at different levels in the widget tree (typically at the top level where the BLoC or Cubit is required).
