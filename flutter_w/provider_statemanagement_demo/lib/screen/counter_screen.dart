import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement_demo/provider/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("build");
    final counterProvider = Provider.of<CounterProvider>(context,listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text("Count : ${value.count}");
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count = count + 1;
          print("count: $count");
          counterProvider.setCount();
          print("floatingActionButton");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
