import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app_demo_first/pages/add_compony/add_company_page.dart';
import 'package:web_app_demo_first/pages/home/home_page.dart';
import 'package:web_app_demo_first/pages/login/login_page.dart';
import 'package:web_app_demo_first/pages/signup/signup_page.dart';
import 'package:web_app_demo_first/pages/update_password/password_update_success_page.dart';
import 'package:web_app_demo_first/pages/update_password/update_password_page.dart';

import 'pages/send_link/reset_link_sent_success_page.dart';
import 'pages/send_link/send_link_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/send_link_page',
      builder: (context, state) => const SendLinkPage(),
    ),
    GoRoute(
      path: '/reset_link_sent_success_page',
      builder: (context, state) => const ResetLinkSentSuccessPage(),
    ),
    GoRoute(
      path: '/update_password_page',
      builder: (context, state) => const UpdatePasswordPage(),
    ),

    GoRoute(
      path: '/password_update_success_page',
      builder: (context, state) => const PasswordUpdateSuccessPage(),
    ),

    GoRoute(
      path: '/home_page',
      builder: (context, state) => const HomePage(),
    ),

    GoRoute(
      path: '/add_company_page',
      builder: (context, state) => const AddCompanyPage(),
    ),
  ],
);
