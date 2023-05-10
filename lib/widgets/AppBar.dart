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
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AppBar(
            title: Container( margin: const EdgeInsets.only(top: 25),
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

            // IconButton(
            //   icon: Icon(Icons.person_pin_circle_outlined, size: 40),
            //   color: Colors.black,
            //   style: ButtonStyle(),
            //   onPressed: () {
            //     Scaffold.of(context).openDrawer();
            //   },
            //   padding: const EdgeInsets.only(left: 20),
            // ),
            ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  //   @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: PreferredSize(
  //       preferredSize: Size.fromHeight(60.0),
  //       child: Container(
  //         margin: EdgeInsets.all(16.0),
  //         decoration: BoxDecoration(
  //           color: const Color(0xFFF0F8FF),
  //           borderRadius: BorderRadius.circular(10.0),
  // boxShadow: [
  //   BoxShadow(
  //     color: Colors.grey.withOpacity(0.3),
  //     spreadRadius: 1,
  //     blurRadius: 5,
  //     offset: Offset(0, 2),
  //   ),
  // ],
  //         ),
  //         child: AppBar(
  //           backgroundColor: Colors.transparent,
  //           elevation: 0,
  //           centerTitle: true,
  //           title: const Text(
  //             'COURTSIDE',
  //             style: TextStyle(
  //               fontFamily: 'Raleway',
  //               fontWeight: FontWeight.w900,
  //               fontSize: 20,
  //               color: Color(0xFF38b6ff),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),

  //   );
  // }
}
