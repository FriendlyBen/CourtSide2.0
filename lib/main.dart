import 'package:courtside_version_2/pages/favourites.dart';
import 'package:courtside_version_2/pages/games.dart';
import 'package:courtside_version_2/pages/homepage.dart';
import 'package:courtside_version_2/pages/players.dart';
import 'package:flutter/material.dart';
import 'package:courtside_version_2/widgets/AppBar.dart';
import 'package:courtside_version_2/widgets/NavBar.dart';
import 'package:courtside_version_2/widgets/Drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(title: 'test',)
  ));
}

class MyApp extends StatefulWidget {
    MyApp({super.key, required this.title});

  final String title;

  @override
  State<MyApp> createState() => _MyAppState();
  }

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(providers: [BlocProvider<BottomNavBarCubit>(create: (context)=> BottomNavBarCubit(),),
    ], child: MaterialApp(
      home: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, selectedIndex){
          return Scaffold(
            appBar: CustomAppBar(),
            drawer: CustomDrawer(),
            body: _getPage(selectedIndex),
            bottomNavigationBar: BottomNavBar(),
          );
        },
      ),
    )
    );
  }
  
  Widget _getPage(int index){
  switch(index){
    case 0:
    return HomePage();
    case 1:
    return GamesPage();
    case 2:
    return PlayersPage();
    case 3:
    return FavouritesPage();
    default:
    return Container();
  }
}
}






