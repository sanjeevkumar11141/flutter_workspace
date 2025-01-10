import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MaterialApp(
    title: "Testing Text in Flutter How To use it..",
    home: Column(
      children: [
        Text(
          "This is a very long text that will wrap onto multiple lines if there is not enough horizontal space.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.deepOrange,
          ),
        ),

       // SizedBox(height: 20,),

        Spacer(),

        Text(
          "This is a very long text that will wrap onto multiple lines if there is not enough horizontal space.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.deepOrange,
          ),
        ),

        Spacer(),

        Text(
          "This is a very long text that will wrap onto multiple lines if there is not enough horizontal space.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.deepOrange,
          ),
        ),
      ],
    )
  ));
}


