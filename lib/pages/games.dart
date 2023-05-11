import 'package:flutter/material.dart';
import 'package:courtside_version_2/widgets/AppBar.dart';
import 'package:courtside_version_2/widgets/Drawer.dart';
import 'package:courtside_version_2/widgets/NavBar.dart';

class GamesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Center(child: Text("This is games page")),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}