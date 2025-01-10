import 'package:bloc_statemanagement_demo/cubit_demo/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_screen.dart';

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterCubit(),child: CounterScreen(),);
  }
}
