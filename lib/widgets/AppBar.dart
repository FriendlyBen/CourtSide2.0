import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AppBar(
            title: Container( margin: const EdgeInsets.only(top: 15),
              child: const Text(
                'COURTSIDE',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF38b6ff)),
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFFF0F8FF),
            elevation: 0,
            leading: Stack(
              children: [
                Positioned(
                    right: 0,
                    bottom: -0.5,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueAccent.withOpacity(0.5),
                    )),
                IconButton(
                  icon: Icon(Icons.person),
                  color: Colors.blue,
                  iconSize: 45,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  padding: const EdgeInsets.only(left: 9, top: 7),
                ),
              ],
            )
            ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
}
