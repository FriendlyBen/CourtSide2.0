import 'package:courtside_version_2/pages/livegame.dart';
import 'package:flutter/material.dart';

class liveGameContainers extends StatelessWidget {
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

  liveGameContainers({
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
    } else if (gameStatus == 'inprogress') {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LiveGamePage(gameID: gameID!),
            ),
          );
        },
        child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          style:  const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          '$gameTitle'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
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
            )),
      );
    } else {
      return Container();
    }
    // else if (gameStatus == 'closed') {} else if (gameStatus == 'inprogress') {}
  }
}
