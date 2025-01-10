import 'package:cercus_client_flutter/constants/number_constants.dart';
import 'package:cercus_client_flutter/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'account_type_box.dart';

class AccountTypeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft, // Adjust alignment as needed
              child: Padding(
                padding: EdgeInsets.all(NumberConstants.value_20), // Add padding for spacing
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/back_arrow.png',
                  ),
                ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.all(NumberConstants.value_30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: NumberConstants.value_60),
                  const Text(
                    StringConstants.accountTypeQuestion,
                    style: TextStyle(
                      fontSize: NumberConstants.value_24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:NumberConstants.value_20),
                  AccountTypeBox(
                    title: StringConstants.client,
                    description:
                    StringConstants.clientDescription,
                    onSelect: () {
                      // Handle select button press for client
                      context.pushNamed('signup_screen');
                    },
                    image: Image.asset('assets/images/ic_artist_selected.png'),
                  ),
                  AccountTypeBox(
                    title: StringConstants.individualArtist,
                    description:
                    StringConstants.artistDescription,
                    onSelect: () {
                      // Handle select button press for artist
                      context.pushNamed('signup_screen');
                    },
                    image: Image.asset('assets/images/combined_shape_copy.png'),
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}