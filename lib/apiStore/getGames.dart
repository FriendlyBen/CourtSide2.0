import 'package:courtside_version_2/widgets/gameContainer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetGames extends StatefulWidget {
  const GetGames({Key? key});

  @override
  _GetGamesState createState() => _GetGamesState();
}

class _GetGamesState extends State<GetGames> {
  static const String apiKey = 'rkcd9u7zu893xzms99pdmxtf';
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

  Future<dynamic>? gameDataFuture;

  @override
  Widget build(BuildContext context) {
    gameDataFuture = getGamesData(2023, 4, 28); //2023, 4, 28 / 2022,8,8

    return FutureBuilder<dynamic>(
      future: gameDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } 
        else {
          dynamic gameData = snapshot.data;
          if (gameData == null || gameData['games'] == null || gameData['games'].isEmpty) {
            return const NoGamesToday();
          } else {
            return Column(
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

                return Game(
                  gameID: gameID ?? '',
                  gameStatus: gameStatus ?? '',
                  gameTitle: gameTitle ?? '',
                  gameTime: gameTime ?? '',
                  gameVenue: gameVenue ?? '',
                  gameVenue2: gameVenue2 ?? '',
                  homeAlias: homeAlias ?? '',
                  homeName: homeName ?? '',
                  awayAlias: awayAlias ?? '',
                  awayName: awayName ?? '',
                );
              }),
            );
          }
        }
      },
    );
  }

  Future<dynamic> getGamesData(int year, int month, int day) async {
    String apiUrl =
        'http://api.sportradar.us/nba/trial/v8/en/games/$year/$month/$day/schedule.json?api_key=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load game data');
    }
  }
}

class NoGamesToday extends StatelessWidget {
  const NoGamesToday();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container( margin: const EdgeInsets.all(10), padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey[300]),
          child: Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[50],
            ),
            child: const Center(child: Text('No Games Today')),
          ),
        ),
      ],
    );
  }
}


