import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  late String? gameID;
  late String? gameStatus;
  late String? gameTitle;
  late String? gameTime;
  late String? gameVenue;
  late String? gameVenue2;
  late String? homeAlias;
  late String? homeName;
  late String? awayAlias;
  late String? awayName;

  Game({
    required this.gameID,
    required this.gameStatus,
    required this.gameTitle,
    required this.gameTime,
    required this.gameVenue,
    required this.gameVenue2,
    required this.homeAlias,
    required this.homeName,
    required this.awayAlias,
    required this.awayName,
  });

  @override
  Widget build(BuildContext context) {
    if(gameID == null){
      return Container(
        height:100, width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.pinkAccent,
        ),
        child: const Text('No Games Today'),
      );
    }
    if (gameStatus == 'closed') {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[350],
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          width: 400,
          height: 150,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(5),
                    width: 100,
                    child: Center(
                      child: Text(
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          gameStatus ?? ''),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        // color: Colors.black,
                        child: Image.asset('assets/team/$homeAlias.png')),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(gameTitle ?? ""),
                            const SizedBox(height: 10),
                            Text(gameTime ?? ""),
                            const SizedBox(height: 10),
                            Text(gameVenue ?? ""),
                          ]),
                    ),
                    SizedBox(
                        height: 100,
                        width: 100,
                        // color: Colors.black,
                        child: Image.asset('assets/team/$awayAlias.png')),
                  ],
                ),
              )
            ],
          ));
    } else if (gameStatus == 'scheduled') {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[350],
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          width: 400,
          height: 150,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(5),
                    width: 100,
                    child: Center(
                      child: Text(
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          gameStatus ?? ""),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        // color: Colors.black,
                        child: Image.asset('assets/team/$homeAlias.png')),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(gameTitle ?? ""),
                            const SizedBox(height: 10),
                            Text(gameTime ?? ""),
                            const SizedBox(height: 10),
                            Text(gameVenue ?? ""),
                          ]),
                    ),
                    SizedBox(
                        height: 100,
                        width: 100,
                        // color: Colors.black,
                        child: Image.asset('assets/team/$awayAlias.png')),
                  ],
                ),
              )
            ],
          ));
    } else {
      return Container();
    }
    // else if (gameStatus == 'closed') {} else if (gameStatus == 'inprogress') {}
  }
}
