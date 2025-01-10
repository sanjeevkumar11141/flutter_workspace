import 'dart:io';
import 'dart:typed_data';
import 'package:cercus_client_flutter/constants/number_constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import '../../constants/string_constants.dart';

class ProfileCompletionScreen extends StatefulWidget {
  const ProfileCompletionScreen({super.key});

  @override
  _ProfileCompletionScreenState createState() =>
      _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<ProfileCompletionScreen> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');
  String _selectedGender = '';

  File? _imageFile;
  Uint8List? _webImage;
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        // For web, get the image as bytes before calling setState
        final webImage = await pickedFile.readAsBytes();
        setState(() {
          _webImage = webImage;
        });
      } else {
        // For mobile, get the image file
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (kIsWeb) {
        // For web, get the image as bytes before calling setState
        final webImage = await pickedFile.readAsBytes();
        setState(() {
          _webImage = webImage;
        });
      } else {
        // For mobile, get the image file
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    }
  }


  //Show options to get image from camera or gallery
  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(NumberConstants.value_16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              StringConstants.signOut,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: NumberConstants.value_8),
                      const Text(
                        StringConstants.helloUser,
                        style: TextStyle(
                            fontSize: NumberConstants.value_21,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: NumberConstants.value_8),
                      const Text(
                        StringConstants.completeProfile,
                        style: TextStyle(fontSize: NumberConstants.value_16),
                      ),
                      const SizedBox(height: NumberConstants.value_30),
                      GestureDetector(
                        onTap: showOptions,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: kIsWeb
                                  ? _webImage == null
                                  ? Image.asset(
                                'assets/images/group_6.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                                  : Image.memory(
                                _webImage!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                                  : _imageFile == null
                                  ? Image.asset(
                                'assets/images/group_6.png',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                                  : Image.file(
                                _imageFile!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (_imageFile != null || _webImage != null) ...[
                              DottedBorder(
                                borderType: BorderType.Circle,
                                dashPattern: [6, 3],
                                color: Colors.blue,
                                strokeWidth: 2,
                                child: Container(
                                  height: 108,
                                  width: 108,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent, // Ensure the container itself is transparent
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: NumberConstants.value_30),
                      const Text(StringConstants.dateOfBirth,
                          style: TextStyle(
                              fontSize: NumberConstants.value_14,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: NumberConstants.value_8),
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null &&
                              pickedDate != _selectedDate) {
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(NumberConstants.value_20),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                            BorderRadius.circular(NumberConstants.value_30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _dateFormat.format(_selectedDate),
                                style: const TextStyle(
                                    fontSize: NumberConstants.value_16,
                                    color: Color(0xFF1d1c1d),
                                    fontWeight: FontWeight.w700),
                              ),
                              const Icon(Icons.calendar_today,
                                  size: NumberConstants.value_24),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: NumberConstants.value_40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          genderButton(StringConstants.male),
                          genderButton(StringConstants.female),
                          genderButton(StringConstants.other),
                        ],
                      ),
                      const SizedBox(height: NumberConstants.value_40),
                      Row(
                        children: [
                          Container(
                            width: NumberConstants.value_100,
                            height: NumberConstants.value_100,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(
                                  NumberConstants.value_8),
                            ),
                            child: const Icon(Icons.arrow_upward,
                                size: NumberConstants.value_24),
                          ),
                          const SizedBox(width: NumberConstants.value_10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.requiredDocument,
                                    style: TextStyle(
                                        fontSize: NumberConstants.value_14)),
                                SizedBox(height: NumberConstants.value_15),
                                Text(StringConstants.identityProof,
                                    style: TextStyle(
                                        fontSize: NumberConstants.value_16,
                                        fontWeight: FontWeight.bold)),
                                Text(StringConstants.uploadInfo,
                                    style: TextStyle(
                                        fontSize: NumberConstants.value_14)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: NumberConstants.value_40),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: NumberConstants.value_50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFffc83b),
                            ),
                            child: const Text(StringConstants.submit,
                                style: TextStyle(
                                    fontSize: NumberConstants.value_16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderButton(String gender) {
    bool isSelected = _selectedGender == gender;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? Colors.teal : Colors.white,
        side: BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NumberConstants.value_30),
        ),
        padding:
        const EdgeInsets.symmetric(horizontal: NumberConstants.value_32),
      ),
      child: Row(
        children: [
          if (isSelected) ...[
            Icon(Icons.check, size: NumberConstants.value_16),
            const SizedBox(width: NumberConstants.value_5),
          ],
          Text(
            gender,
            style: TextStyle(
              fontSize: NumberConstants.value_16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
