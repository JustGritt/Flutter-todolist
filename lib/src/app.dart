import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        toolbarHeight: 0, 
        elevation: 0,
      ),
      body: const Column(
        children: [
          Expanded(child: Header()), 
          Footer(),
        ],
      ),
    );
  }
}
