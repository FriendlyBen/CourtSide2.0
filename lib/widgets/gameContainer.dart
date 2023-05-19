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
    if (gameID == null) {
      return Container(
        height: 100,
        width: 400,
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
            color: Colors.grey[100],
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
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/team/$homeAlias.png'),
                                  fit: BoxFit.contain)),
                        )),
                    Container(
                      // color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
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
                    Container(
                        height: 100,
                        width: 100,
                        // color: Colors.black,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/team/$awayAlias.png'),
                                  fit: BoxFit.contain)),
                        )),
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
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                color: Colors.black,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage('assets/team/$homeAlias.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // SizedBox(width: 8),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gameTitle ?? "",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              gameTime ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              gameVenue ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 8),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage('assets/team/$awayAlias.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ));
    } else if (gameStatus == 'inprogress') {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.greenAccent,
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
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/team/$homeAlias.png'),
                                  fit: BoxFit.contain)),
                        )),
                    Container(
                      // color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
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
                    Container(
                        height: 100,
                        width: 100,
                        // color: Colors.black,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/team/$awayAlias.png'),
                                  fit: BoxFit.contain)),
                        )),
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
