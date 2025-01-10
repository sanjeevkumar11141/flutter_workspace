import 'package:flutter/material.dart';
import 'package:web_app_demo_first/shared/reusable_text_field.dart';

class NewInspectionPage extends StatefulWidget {
  const NewInspectionPage({super.key});

  @override
  State<NewInspectionPage> createState() => _NewInspectionPageState();
}

class _NewInspectionPageState extends State<NewInspectionPage> {
  bool? _isFollowUpEnabled; // Add this to your State class

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32.0),
          child: constraints.maxWidth > 600
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Expanded(
                      flex: 2,
                      child: _buildHeaderSection(),
                    ),
                    const SizedBox(width: 40),
                    // Form Section
                    Expanded(
                      flex: 3,
                      child: _buildFormSection(),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderSection(),
                    const SizedBox(height: 20),
                    _buildFormSection(),
                  ],
                ),
        );
      },
    );
  }

  // Reusable widget for the header section
  Widget _buildHeaderSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start a new inspection',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Invite someone to capture their space. Unless you turn off auto follow-ups, they will receive a notification plus three reminder messages.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Reusable widget for the form section
  Widget _buildFormSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text Fields for the form
        const ReusableTextFormField(labelText: 'Project Number'),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: ReusableTextFormField(labelText: 'First Name*'),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ReusableTextFormField(labelText: 'Last Name*'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: ReusableTextFormField(labelText: '(123) 456-7890*'),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ReusableTextFormField(labelText: 'example@example.com*'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const ReusableTextFormField(
          labelText: '123 Main Street, Boston, MA, 01234*',
        ),
        const SizedBox(height: 16),
        const ReusableTextFormField(
          labelText: 'Select Inspection*',
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        const SizedBox(height: 16),
        // Edit Message Section
        const Text(
          'Edit Message to Client',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const ReusableTextFormField(
          labelText: '',
          maxLines: 4,
          isDense: true,
          hintText: 'Enter your message here...',
        ),
        const SizedBox(height: 16),
        // Radio buttons for Automated Follow-Ups

        Row(
          children: [
            Expanded(
              flex: 2,
              // Adjust the flex value to control the space taken by the text
              child: const Text(
                'Automated Follow-Ups',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 3,
              // Adjust the flex value to control the space taken by radio buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // Align radio buttons to the right
                children: [
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: _isFollowUpEnabled,
                        onChanged: (bool? value) {
                          setState(() {
                            _isFollowUpEnabled = value;
                          });
                        },
                      ),
                      const Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<bool>(
                        value: false,
                        groupValue: _isFollowUpEnabled,
                        onChanged: (bool? value) {
                          setState(() {
                            _isFollowUpEnabled = value;
                          });
                        },
                      ),
                      const Text('No'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
        // Buttons

        Row(
          children: [
            Expanded(
              flex: 2,
              // Adjust the flex value to control the space taken by the text
              child: GestureDetector(
                onTap: () {
                  // Handle copy message action
                },
                child: const Text(
                  'Copy message & link to clipboard',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              // Adjust the flex value to control the space taken by radio buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle cancel action
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle send action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
