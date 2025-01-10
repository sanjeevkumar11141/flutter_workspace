import 'package:flutter/material.dart';

enum Gender {
  male,
  female;
}

class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({super.key});

  @override
  State<RadioButtonExample> createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  Gender gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Example'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Row(
        children: [
          Radio<Gender>(
            value: Gender.male,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            },
          ),
          Text('Male'),

          Radio<Gender>(
            value: Gender.female,
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            },
          ),
          Text('Female'),
        ],
      ),
    );
  }
}
