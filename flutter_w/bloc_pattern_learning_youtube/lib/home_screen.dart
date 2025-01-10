import 'package:bloc_pattern_learning_youtube/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              print("Inside BlocBuilder $state");
              if (state is InternetGainedState) {
                return Text("Internet Connected");
              } else if (state is InternetLostState) {
                return Text("Internet Lost");
              } else if (state is InternetInitialState) {
                return Text("Internet Initial State Loading...");
              } else {
                return Text("Unknown state");
              }
            },
          ),
        ),
      ),
    );
  }
}
