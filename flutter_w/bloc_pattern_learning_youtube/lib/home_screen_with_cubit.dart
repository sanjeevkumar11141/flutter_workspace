import 'package:bloc_pattern_learning_youtube/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenWithCubit extends StatelessWidget {
  const HomeScreenWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Connected!"),
                  backgroundColor: Colors.green,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Not Connected!"),
                  backgroundColor: Colors.red,
                ));
              }
            },
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
