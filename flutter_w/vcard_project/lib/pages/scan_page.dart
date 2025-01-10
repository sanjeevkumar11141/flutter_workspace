import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vcard_project/models/contact_model.dart';
import 'package:vcard_project/pages/form_page.dart';
import 'package:vcard_project/utils/constants.dart';

class ScanPage extends StatefulWidget {
  static const String routeName = "scan_page";

  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool isScanOver = false;
  List<String> lineList = [];
  String name = '',
      mobile = '',
      email = '',
      address = '',
      company = '',
      designation = '',
      website = '',
      mImage = '';

  void createContactModel() {
    final contactModel = ContactModel(
        name: name,
        mobile: mobile,
        email: email,
        address: address,
        company: company,
        designation: designation,
        website: website,
        image: mImage);

    context.goNamed(FormPage.routeName,extra: contactModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Page'),
        actions: [
          IconButton(
              onPressed: mImage.isEmpty ? null : createContactModel,
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  _getImage(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
              TextButton.icon(
                onPressed: () {
                  _getImage(ImageSource.gallery);
                },
                icon: Icon(Icons.photo_album),
                label: Text('Gallery'),
              )
            ],
          ),
          if (isScanOver)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DropTargetItem(
                        property: ContactProperties.name,
                        onDrop: getPropertyValue),
                    DropTargetItem(
                        property: ContactProperties.mobile,
                        onDrop: getPropertyValue),
                    DropTargetItem(
                        property: ContactProperties.email,
                        onDrop: getPropertyValue),
                    DropTargetItem(
                        property: ContactProperties.company,
                        onDrop: getPropertyValue),
                    DropTargetItem(
                        property: ContactProperties.address,
                        onDrop: getPropertyValue),
                    DropTargetItem(
                        property: ContactProperties.designation,
                        onDrop: getPropertyValue),
                    DropTargetItem(
                        property: ContactProperties.website,
                        onDrop: getPropertyValue)
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Wrap(
                spacing: 10,
                children:
                    lineList.map((line) => ListItem(line: line)).toList()),
          )
        ],
      ),
    );
  }

  Future<void> _getImage(ImageSource imageSource) async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: imageSource);
    if (image != null) {
      mImage = image.path;
      EasyLoading.show(status: "please wait...");
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText = await textRecognizer
          .processImage(InputImage.fromFile(File(image.path)));
      EasyLoading.dismiss();

      List<String> tempList = [];

      String text = recognizedText.text;
      for (TextBlock block in recognizedText.blocks) {
        // final Rect rect = block.boundingBox;
        // final List<Point<int>> cornerPoints = block.cornerPoints;
        // final String text = block.text;
        // final List<String> languages = block.recognizedLanguages;
        for (TextLine line in block.lines) {
          tempList.add(line.text);
        }
      }
      setState(() {
        lineList = tempList;
        isScanOver = true;
      });
      print(tempList);
    }
  }

  void getPropertyValue(String property, String value) {
    switch (property) {
      case ContactProperties.name:
        name = value;
        break;
      case ContactProperties.mobile:
        mobile = value;
        break;
      case ContactProperties.email:
        email = value;
        break;
      case ContactProperties.company:
        company = value;
        break;

      case ContactProperties.designation:
        designation = value;
        break;
      case ContactProperties.website:
        website = value;
        break;
      case ContactProperties.address:
        address = value;
        break;
    }
  }
}

class ListItem extends StatelessWidget {
  final String line;

  const ListItem({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      data: line,
      dragAnchorStrategy: childDragAnchorStrategy,
      feedback: Container(
        key: GlobalKey(),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Colors.black45),
        child: Text(line,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white)),
      ),
      child: Chip(
        label: Text(line),
        padding: const EdgeInsets.only(left: 0, right: 8.0),
      ),
    );
  }
}

class DropTargetItem extends StatefulWidget {
  final String property;
  final Function(String, String) onDrop;

  const DropTargetItem(
      {super.key, required this.property, required this.onDrop});

  @override
  State<DropTargetItem> createState() => _DropTargetItemState();
}

class _DropTargetItemState extends State<DropTargetItem> {
  String dragItem = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(widget.property)),
        Expanded(
            flex: 2,
            child: DragTarget<String>(
              builder: (BuildContext context, List<String?> candidateData,
                      List<dynamic> rejectedData) =>
                  Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: candidateData.isNotEmpty
                      ? Border.all(color: Colors.red, width: 2)
                      : null,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(dragItem.isEmpty ? "Drag Here" : dragItem)),
                    if (dragItem.isNotEmpty)
                      InkWell(
                        onTap: () {
                          setState(() {
                            dragItem = '';
                          });
                        },
                        child: Icon(
                          Icons.clear,
                          size: 15,
                        ),
                      )
                  ],
                ),
              ),
              onAccept: (value) {
                setState(() {
                  if (dragItem.isEmpty) {
                    dragItem = value;
                  } else {
                    dragItem += ' $value';
                  }
                });
                widget.onDrop(widget.property, dragItem);
              },
            ))
      ],
    );
  }
}
