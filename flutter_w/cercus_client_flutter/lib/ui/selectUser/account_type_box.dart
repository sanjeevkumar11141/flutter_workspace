import 'package:cercus_client_flutter/constants/string_constants.dart';
import 'package:flutter/material.dart';

import '../../constants/number_constants.dart';

class AccountTypeBox extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onSelect;
  final Image image;

  AccountTypeBox({
    required this.title,
    required this.description,
    required this.onSelect,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: NumberConstants.value_10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF337283),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              child: image,
            ),
            SizedBox(width: NumberConstants.value_20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: NumberConstants.value_20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: NumberConstants.value_10),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: NumberConstants.value_16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: NumberConstants.value_10),
                  const Text(
                    StringConstants.select,
                    style: TextStyle(
                      fontSize: NumberConstants.value_16,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
