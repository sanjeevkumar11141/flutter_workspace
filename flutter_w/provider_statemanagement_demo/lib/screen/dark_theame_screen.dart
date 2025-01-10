import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement_demo/provider/dark_theame_provider.dart';

class DarkTheameScreen extends StatefulWidget {
  const DarkTheameScreen({super.key});

  @override
  State<DarkTheameScreen> createState() => _DarkTheameScreenState();
}

class _DarkTheameScreenState extends State<DarkTheameScreen> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkTheameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Change Example'),
      ),
      body: Center(

        child: SwitchListTile(
          title: Text('Dark Mode'),
          value: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (bool value) {
            themeProvider.toggleTheme(value);
          },
        ),
      ),
    );
  }
}
