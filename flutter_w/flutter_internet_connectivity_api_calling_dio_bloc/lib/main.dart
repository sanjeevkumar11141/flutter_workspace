import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internet_connectivity_api_calling_dio_bloc/repository/api_repository.dart';
import 'package:flutter_internet_connectivity_api_calling_dio_bloc/screen/home_screen.dart';
import 'package:provider/provider.dart';

import 'bloc/api_bloc.dart';
import 'networking/dio_api_base_helper.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DioApiBaseHelper>(create: (_) => DioApiBaseHelper()),
        Provider<ApiRepository>(
          create: (context) => ApiRepository(context.read<DioApiBaseHelper>()),
        ),
        BlocProvider<ApiBloc>(
          create: (context) => ApiBloc(context.read<ApiRepository>()),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

