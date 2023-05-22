import 'package:courtside_version_2/apiStore/getGames.dart';
import 'package:courtside_version_2/apiStore/getLiveGames.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
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

  late Future<dynamic>? gameDataFuture;

  @override
  void initState() {
    super.initState();
    gameDataFuture = getData(2023, 5, 21);
  }

  Future<dynamic> getData(int year, int month, int day) async {
    String apiUrl =
        'http://api.sportradar.us/nba/trial/v8/en/games/$year/$month/$day/schedule.json?api_key=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // print(response.body);
      // print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[400],
              ),
              margin: const EdgeInsets.all(10),
              width: 500,
              height: 40,
              child: const Center(
                child: Text('This is for the date bar'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Today', style: TextStyle(fontSize: 25)),
                ],
              ),
            ),
            FutureBuilder<dynamic>(
                future: gameDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Error occured');
                  } else {
                    final dynamic gameData = snapshot.data;

                    if (gameData['games'].isEmpty) {
                      return const Text('No data available');
                    } else {
                      return Column(
                        children: [
                          GetLiveGames(data: gameData),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[300],
                              ),
                              margin: const EdgeInsets.all(3),
                              padding: const EdgeInsets.all(5),
                              child: GetGames(gameData: gameData)),
                        ],
                      );
                    }
                  }
                })
          ],
        )),
      ),
    );
  }
}
