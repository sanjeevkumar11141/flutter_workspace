import 'package:flutter/material.dart';
import 'package:vcard_project/models/contact_model.dart';

import '../utils/constants.dart';

class FormPage extends StatefulWidget {
  static const String routeName = "form_page";
  final ContactModel contactModel;

  const FormPage({super.key, required this.contactModel});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _designationController = TextEditingController();
  final _websiteController = TextEditingController();
  final _companyController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.contactModel.name;
    _mobileController.text = widget.contactModel.mobile;
    _emailController.text = widget.contactModel.email;
    _addressController.text = widget.contactModel.address;
    _designationController.text = widget.contactModel.designation;
    _websiteController.text = widget.contactModel.website;
    _companyController.text = widget.contactModel.company;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
        actions: [
          IconButton(onPressed: saveContactDetials, icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Contact Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldErrorMsg;
                }
                return null;
              }
            ),

            TextFormField(
              keyboardType: TextInputType.phone,
                controller: _mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrorMsg;
                  }
                  return null;
                }
            ),

            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                ),
              validator: (value){
                  null;
              },
            ),

            TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Street Address',
                ),
            ),

            TextFormField(
                controller: _designationController,
                decoration: InputDecoration(
                  labelText: 'Designation',
                ),
            ),

            TextFormField(
                controller: _companyController,
                decoration: InputDecoration(
                  labelText: 'Company Name',
                ),
            ),

            TextFormField(
                controller: _websiteController,
                decoration: InputDecoration(
                  labelText: 'Website Link',
                ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _designationController.dispose();
    _websiteController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  void saveContactDetials() async{
    if(_key.currentState!.validate()){
      widget.contactModel.name = _nameController.text;
      widget.contactModel.mobile = _mobileController.text;
      widget.contactModel.email = _emailController.text;
      widget.contactModel.address = _addressController.text;
      widget.contactModel.designation = _designationController.text;
      widget.contactModel.company = _companyController.text;
      widget.contactModel.website = _websiteController.text;
    }
  }
}
