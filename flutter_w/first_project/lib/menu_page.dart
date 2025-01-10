import 'package:first_project/app_counter.dart';
import 'package:first_project/checkbox_example.dart';
import 'package:first_project/input_widget_example.dart';
import 'package:first_project/radio_button_example.dart';
import 'package:first_project/to_do_app.dart';
import 'package:first_project/udemy_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_example.dart';
import 'drop_down_list_example.dart';
import 'model_bottom_sheet_example.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MenuPage'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: Text("Go Home"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AppCounter()));
                },
                child: Text("App Counter")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InputWidgetExample()));
                },
                child: Text("Input Example")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckboxExample()));
                },
                child: Text("Checkbox Example")
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RadioButtonExample()));
                },
                child: Text("RadioButton Example")
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DropDownListExample()));
                },
                child: Text("DropDownListExample")
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ModelBottomSheetExample()));
                },
                child: Text("ModelBottomSheetExample")
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ToDoApp()));
                },
                child: Text("ToDoApp")
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DialogExample()));
                },
                child: Text("Show Dialog")
            ),
          ],
        ),
      ),
    );
  }
}
