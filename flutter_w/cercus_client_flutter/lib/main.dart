import 'package:cercus_client_flutter/ui/completeProfile/profile_completion_screen.dart';
import 'package:cercus_client_flutter/ui/demo_svg_screen.dart';
import 'package:cercus_client_flutter/ui/forgetPassword/password_link_screen.dart';
import 'package:cercus_client_flutter/ui/image_picker_demo.dart';
import 'package:cercus_client_flutter/ui/login/login_screen.dart';
import 'package:cercus_client_flutter/ui/selectUser/account_type_selection_screen.dart';
import 'package:cercus_client_flutter/ui/signup/signup_screen.dart';
import 'package:cercus_client_flutter/ui/signup/verification_screen.dart';
import 'package:cercus_client_flutter/ui/splash/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ui/forgetPassword/forget_password_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _route,
    );
  }
  
  
  final _route = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreenPage(),
      ),
      GoRoute(
        path: '/login_screen',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: 'forget_password_screen',
            name: "forget_password_screen",
            builder: (context, state) =>  const ForgotPasswordScreen(),
          ),

          GoRoute(
            path: 'signup_screen',
            name: "signup_screen",
            builder: (context, state) =>  SignupScreen(),
          ),

          GoRoute(
            path: 'account_type_selection_screen',
            name: "account_type_selection_screen",
            builder: (context, state) =>  AccountTypeSelectionScreen(),
          ),

          GoRoute(
            path: 'verification_screen',
            name: "verification_screen",
            builder: (context, state) =>  const VerificationScreen(),
          ),

          GoRoute(
            path: 'profile_completion_screen',
            name: "profile_completion_screen",
            builder: (context, state) =>  const ProfileCompletionScreen(),
          ),

          GoRoute(
            path: 'image_picker_demo',
            name: "image_picker_demo",
            builder: (context, state) =>  const ImagePickerDemo(),
          ),
        ]
      ),

      GoRoute(
        path: '/password_link_screen',
        name: "password_link_screen",
        builder: (context, state) =>  const PasswordLinkScreen(),
      ),
    ],
  );
}



