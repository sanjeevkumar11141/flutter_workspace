import 'package:bloc_statemanagement_demo/bloc_counter_demo/screen/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),  // Provide the BLoC
      child: CounterScreen(),
    );
  }
}