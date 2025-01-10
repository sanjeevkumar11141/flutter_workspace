import 'package:flutter/material.dart';


class WebCameraExample extends StatefulWidget {
  @override
  _WebCameraExampleState createState() => _WebCameraExampleState();
}

class _WebCameraExampleState extends State<WebCameraExample> {
  SimpleWebCamera? _camera;

  @override
  void initState() {
    super.initState();
    _camera = SimpleWebCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Web Camera Example')),
      body: Column(
        children: [
          Expanded(
            child: _camera!,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final imageUrl = await _camera?.takePicture();
                  if (imageUrl != null) {
                    setState(() {
                      // Display the captured image
                    });
                  }
                },
                child: Text('Capture Image'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final imageUrl = await _camera?.pickImage();
                  if (imageUrl != null) {
                    setState(() {
                      // Display the selected image
                    });
                  }
                },
                child: Text('Pick from Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _camera?.dispose();
    super.dispose();
  }
}
