import 'package:flutter/material.dart';
import 'package:courtside_version_2/widgets/AppBar.dart';
import 'package:courtside_version_2/widgets/Drawer.dart';
import 'package:courtside_version_2/widgets/NavBar.dart';

class FavouritesPage extends StatelessWidget{
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Center(child: Text("This is Favourites page")),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}