import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_udemy_course_example/login_page.dart';
import 'package:navigation_udemy_course_example/one_page.dart';
import 'package:navigation_udemy_course_example/profile_page.dart';
import 'package:navigation_udemy_course_example/two_page.dart';

import 'home_page.dart';
import 'one_page_details.dart';

 const loggedIn = false;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }

  //So this route is at the same level.
  //
  // So if you declare route in this way, at the same level, then whenever you change the route, the old
  //
  // route is actually replaced.

  final _router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if(!loggedIn){
        return '/login';
      }
    },
  //  errorBuilder: (context, state) => const ErrorPage(),
    routes: [
      GoRoute(name: HomePage.routeName,
          path: '/',
          builder: (context, state) => HomePage(),
          routes: [
            GoRoute(
              name: "two_from_home",
              path: 'two',
              builder: (context, state) {
                final msg = state.extra as String;
                return TwoPage(msg: msg);
              },
            ),
            GoRoute(
                name: ProfilePage.routeName,
                path: 'profile_page/:profileId',
                builder: (context, state) {
                 final  profileId = state.pathParameters['profileId']!;
                return  ProfilePage(profileId:int.parse(profileId));
                }
            )
          ]),
      GoRoute(name: OnePage.routeName,
          path: '/one',
          builder: (context, state) => OnePage(),
          routes: [
            GoRoute(
                name: OnePageDetails.routeName,
                path: 'one_details',
                builder: (context, state) => OnePageDetails(),
                routes: [
                  GoRoute(
                    name: 'two_from_one_details',
                    path: 'two',
                    builder: (context, state) => TwoPage(msg: 'Hello For Page One Details Screen'),
                  )
                ]),
          ]),

      GoRoute(
        path: '/login',
        builder: (context, state) {

          return LoginPage();
        },
      )
    ],
  );
}
