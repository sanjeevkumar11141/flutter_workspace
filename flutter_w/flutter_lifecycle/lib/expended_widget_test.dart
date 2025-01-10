import 'package:flutter/material.dart';



class ExpendedWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Expanded Widget Example')),
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: 100, // Fixed height
              child: Center(child: Text('Top Container (100 height)')),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
                child: Center(child: Text('Expanded Container')),
              ),
            ),

            Expanded(
              flex: 2, // Takes twice the space of the second container
              child: Container(
                color: Colors.yellow,
                child: Center(child: Text('Expanded 1 (flex: 2)')),
              ),
            ),
            Expanded(
              flex: 1, // Takes half the space of the first container
              child: Container(
                color: Colors.orange,
                child: Center(child: Text('Expanded 2 (flex: 1)')),
              ),
            ),

            Container(
              color: Colors.blue,
              height: 100, // Fixed height
              child: Center(child: Text('Bottom Container (100 height)')),
            ),
          ],
        ),
      ),
    );
  }
}
