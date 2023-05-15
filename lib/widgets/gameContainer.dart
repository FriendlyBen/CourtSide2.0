import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  late String gameID;
  late String gameStatus;
  late String gameTitle;
  late String gameTime;
  late String gameVenue;
  late String gameVenue2;
  late String homeAlias;
  late String homeName;
  late String awayAlias;
  late String awayName;

  Game({
    super.key,
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
    if (gameStatus == 'closed') {
      return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 80,
        color: Colors.grey,
        child: Row(children: [
          Container(
            color: Colors.black,
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/team/$homeAlias.png',
            ),
          ),
          Column(
            children: [
              Text(gameTitle),
              Text(gameTime),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/team/$awayAlias.png',
            ),
          )
        ]),
      );
    }
    else{
      return Container();
    }
    // else if (gameStatus == 'closed') {} else if (gameStatus == 'inprogress') {}
  }
}
