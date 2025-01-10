import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Input Example'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = value!;
              });
            },
          ),
          Text('Flutter')
        ],
      ),
    );
  }
}
