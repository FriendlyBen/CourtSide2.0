import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String title = 'CourtSide 2.0';

  @override
  State<HomePage> createState() => _HomePageState();
  
  // this is where I initialize state
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomePage.title),
      ),
      body: const Center(child: Text('Welcome to the HomePage'),)
    );
  }
}
