import 'package:courtside_version_2/widgets/gameContainer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetGames extends StatefulWidget {
  const GetGames({super.key}); //get the date
  @override
  _getGamesState createState() => _getGamesState();
}

class _getGamesState extends State<GetGames> {
  static const String apiKey = 'rkcd9u7zu893xzms99pdmxtf';
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

  dynamic gameData;

  @override
  void initState() {
    super.initState();
    getGamesData(2023, 4, 28);
  }

  Future<dynamic> getGamesData(int year, int month, int day) async {
    String apiUrl =
        'http://api.sportradar.us/nba/trial/v8/en/games/$year/$month/$day/schedule.json?api_key=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        gameData = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: gameData == null
          ? const CircularProgressIndicator()
          : Column(
              children: List.generate(gameData['games'].length, (index) {
                var gameData2 = gameData['games'][index];
                gameID = gameData2['id'];
                gameStatus = gameData2['status'];
                gameTitle = gameData2['title'];
                gameTime = gameData2['scheduled'];
                gameVenue = gameData2['venue']['name'];
                gameVenue2 = gameData2['venue']['city'];
                homeName = gameData2['home']['name'];
                homeAlias = gameData2['home']['alias'];
                awayName = gameData2['away']['name'];
                awayAlias = gameData2['away']['alias'];

                print('Test: ${homeAlias}, ${awayAlias}, ${gameStatus}');

                return Game(
                  gameID: gameID,
                  gameStatus: gameStatus,
                  gameTitle: gameTitle,
                  gameTime: gameTime,
                  gameVenue: gameVenue,
                  gameVenue2: gameVenue2,
                  homeAlias: homeAlias,
                  homeName: homeName,
                  awayAlias: awayAlias,
                  awayName: awayName,
                );

              }),
            ),
    );
  }
}

// if (snapshot.connectionState == ConnectionState.waiting) {
//   return const CircularProgressIndicator();
// } else if (snapshot.hasError) {
//   return Text('Error: ${snapshot.error}');
// } else {
//   var gameData = snapshot.data;
//   print('Build: ${gameData}');
//   return Container(
//     child: gameData == null
//         ? const CircularProgressIndicator()
//         : Column(
//             children:
//                 List.generate(gameData['games'].length, (index) {
//               var gameData2 = gameData['games'][index];
              // gameID = gameData2['id'];
              // gameStatus = gameData2['status'];
              // gameTitle = gameData2['title'];
              // gameTime = gameData2['scheduled'];
              // gameVenue = gameData2['venue']['name'];
              // gameVenue2 = gameData2['venue']['city'];
              // homeName = gameData2['home']['name'];
              // homeAlias = gameData2['home']['alias'];
              // awayName = gameData2['away']['name'];
              // awayAlias = gameData2['away']['alias'];

//               print("Test: ${homeAlias}");

              // return Game(
              //   gameID: gameID,
              //   gameStatus: gameStatus,
              //   gameTitle: gameTitle,
              //   gameTime: gameTime,
              //   gameVenue: gameVenue,
              //   gameVenue2: gameVenue2,
              //   homeAlias: homeAlias,
              //   homeName: homeName,
              //   awayAlias: awayAlias,
              //   awayName: awayName,
              // );
//             }),
//           ),
//   );
