import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/gameContainer.dart';

class GetLiveGames extends StatefulWidget {
  const GetLiveGames({Key? key, required data}) : super(key: key);

  @override
  _GetLiveGamesState createState() => _GetLiveGamesState();
}

class _GetLiveGamesState extends State<GetLiveGames> {
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

  late Future<dynamic> liveGameDataFuture;

  Future<dynamic> getLiveGamesData(int year, int month, int day) async {
    String apiUrl =
        'http://api.sportradar.us/nba/trial/v8/en/games/$year/$month/$day/schedule.json?api_key=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load game data');
    }
  }

  @override
  void initState() {
    super.initState();
    liveGameDataFuture = getLiveGamesData(2023, 4, 28);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: liveGameDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          dynamic liveGame = snapshot.data;
          if (liveGame == null ||
              liveGame['games'] == null ||
              liveGame['games'].isEmpty) {
            return const NoLiveGameToday();
          } else {
            bool hasLiveGame = false;
            List<Widget> gameWidgets = List.generate(
              liveGame['games'].length,
              (index) {
                var liveGame2 = liveGame['games'][index];
                gameID = liveGame2['id'];
                gameStatus = liveGame2['status'];
                gameTitle = liveGame2['title'];
                gameTime = liveGame2['scheduled'];
                gameVenue = liveGame2['venue']['name'];
                gameVenue2 = liveGame2['venue']['city'];
                homeName = liveGame2['home']['name'];
                homeAlias = liveGame2['home']['alias'];
                awayName = liveGame2['away']['name'];
                awayAlias = liveGame2['away']['alias'];

                // print(gameStatus);

                //have to filter. If game == inprogress, only pass data to Game().
                if (gameStatus == 'inprogress') {
                  hasLiveGame = true;
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
                }
                return Container();
              },
            );

            if (!hasLiveGame) {
              gameWidgets.add(const NoLiveGameToday());
            }

            return Column(
              children: gameWidgets,
            );
          }
        }
      },
    );
  }
}

class NoLiveGameToday extends StatelessWidget {
  const NoLiveGameToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
          ),
          child: Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[50],
            ),
            child: const Center(child: Text('No Live Games Today')),
          ),
        ),
      ],
    );
  }
}
