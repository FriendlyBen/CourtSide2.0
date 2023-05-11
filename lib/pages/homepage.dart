import 'package:flutter/material.dart';
import 'package:courtside_version_2/widgets/AppBar.dart';
import 'package:courtside_version_2/widgets/NavBar.dart';
import 'package:courtside_version_2/widgets/Drawer.dart';


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
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: const Center(child: Text("Testing"),
        ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
