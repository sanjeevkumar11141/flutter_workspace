import 'package:bloc_pattern_learning_youtube/bloc/internet_bloc.dart';
import 'package:bloc_pattern_learning_youtube/cubits/internet_cubit.dart';
import 'package:bloc_pattern_learning_youtube/home_screen.dart';
import 'package:bloc_pattern_learning_youtube/home_screen_with_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(), // When using cubit we only need to chnage hare insteed using bloc class need to use cubit class
     // create: (context) => InternetCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreenWithCubit(),
      ),
    );
  }
}

