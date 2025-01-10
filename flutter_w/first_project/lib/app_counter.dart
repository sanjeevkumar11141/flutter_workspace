

import 'package:flutter/material.dart';

class AppCounter extends StatefulWidget {
  const AppCounter({super.key});

  @override
  State<AppCounter> createState() => _AppCounterState();
}

class _AppCounterState extends State<AppCounter> {
  int count  = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('App Counter'),backgroundColor: Colors.pink.shade200,),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
         setState(() {
           count++;
         });
        },
        child: Icon(Icons.add, color: Colors.pink.shade200,),
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("You Have pressed the button many times:", ),
            Text("$count", style: TextStyle(fontSize: 50), )
          ],
        ),
      ),

    );
  }
}
