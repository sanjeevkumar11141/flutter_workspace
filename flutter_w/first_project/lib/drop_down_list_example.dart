import 'package:flutter/material.dart';

class DropDownListExample extends StatefulWidget {
  const DropDownListExample({super.key});

  @override
  State<DropDownListExample> createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<DropDownListExample> {
  final citys = [
    'Aligarh',
    'Bulandshahr',
    'Chandigarh',
    'Delhi',
    'England',
    'Finland'
  ];
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Example'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text('Select your city'),
          value: selectedCity,
          items: citys.map((item) => DropdownMenuItem<String>(
                child: Text(item),
                value: item,
              )).toList(),
          onChanged: (value) {
            setState(() {
              selectedCity = value;
            });
          },
        ),
      ),
    );
  }
}
