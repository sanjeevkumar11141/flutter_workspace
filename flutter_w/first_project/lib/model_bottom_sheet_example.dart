import 'package:flutter/material.dart';

class ModelBottomSheetExample extends StatefulWidget {
  const ModelBottomSheetExample({super.key});

  @override
  State<ModelBottomSheetExample> createState() =>
      _ModelBottomSheetExampleState();
}

class _ModelBottomSheetExampleState extends State<ModelBottomSheetExample> {

  void _showModalSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context){
      return Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
          ListTile(
            leading: Icon(Icons.copy),
            title: Text('Copy Link'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ],
      );
    });
  }

  void _showFullScreenModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,  // Allow the bottom sheet to cover the whole screen
      builder: (context) {
        // Use MediaQuery to get the full height of the screen
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
              ),
              ListTile(
                leading: Icon(Icons.copy),
                title: Text('Copy Link'),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Creating a Modal Bottom Sheet'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: ElevatedButton(
                onPressed: () {
                  _showModalSheet(context);
                },
                child: Text("Show Model Bottom Sheet")
            ),
          );
        },
      ),
    );
  }
}


