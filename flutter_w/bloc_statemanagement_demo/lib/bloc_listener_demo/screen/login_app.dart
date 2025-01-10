import 'package:bloc_statemanagement_demo/bloc_listener_demo/cubit/login_cubit.dart';
import 'package:bloc_statemanagement_demo/bloc_listener_demo/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),child: LoginScreen(),);
  }
}