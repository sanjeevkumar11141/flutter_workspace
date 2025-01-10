import 'package:flutter/material.dart';

import '../bloc_listener_demo/screen/login_app.dart';
import '../cubit_demo/screen/my_counter_app.dart';
import 'home_screen.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: Text("Bloc Concept")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MyCounterApp()));
                  },
                  child: Text("Cubit Concept")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginApp()));
                  },
                  child: Text("Bloc Listener Concept"))
            ],
          ),
        ),
      ),
    );
  }
}
