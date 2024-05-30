import 'package:flutter/material.dart';
import '../global.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Global().selectedColor,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Blue'),
            onTap: () {
              Global().setColor(Colors.blue[400]!);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Green'),
            onTap: () {
              Global().setColor(Colors.green[400]!);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Orange'),
            onTap: () {
              Global().setColor(Colors.orange[400]!);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Purple'),
            onTap: () {
              Global().setColor(Colors.deepPurple[400]!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}