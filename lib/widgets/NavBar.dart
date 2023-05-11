import 'package:courtside_version_2/pages/homepage.dart';
import 'package:courtside_version_2/pages/games.dart';
import 'package:courtside_version_2/pages/favourites.dart';
import 'package:courtside_version_2/pages/players.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), GamesPage(), FavouritesPage(), PlayersPage(),];

  Widget _currentPage = HomePage();

  final List<BottomNavigationBarItem> _BottomNavBarItems = [

    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.blueAccent,
        size: 40,
      ),
      label: 'Home',
      // backgroundColor: Colors.blueAccent,
    ),

    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_basketball,
        color: Colors.blueAccent,
        size: 40,

      ),
      label: 'Games',
      // backgroundColor: Colors.blueAccent,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person, color: Colors.blueAccent,size:40,),
      label: 'Players',
      
      // backgroundColor: Colors.blueAccent,
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.star,
        color: Colors.blueAccent,
        size: 40,
        
      ),
      label: 'Favourites',
      // backgroundColor: Colors.blueAccent,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _currentPage = _pages[index];
    });

    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> _currentPage));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 3)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: _BottomNavBarItems,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}
