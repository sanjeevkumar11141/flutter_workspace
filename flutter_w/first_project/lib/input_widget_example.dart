import 'package:flutter/material.dart';

class InputWidgetExample extends StatefulWidget {
  const InputWidgetExample ({super.key});

  @override
  State<InputWidgetExample> createState() => _State();
}

class _State extends State<InputWidgetExample> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Example'),backgroundColor: Colors.pink.shade200,),
      body:SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name Here',
                border: OutlineInputBorder(),
                  labelText: 'User Name'
              ),
            ),
            ElevatedButton(onPressed: (){
              print(nameController.text);
            }, child: Text('Ok'))
          ],
        ),
      ),
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: nameController,
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Thanks!'),
                  content: Text(
                      'You typed "$value", which has length ${value.characters.length}.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }*/
}
