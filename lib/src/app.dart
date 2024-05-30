import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Header(),
          Expanded(child: SizedBox()), 
          Footer(),
        ],
      ),
    );
  }
}