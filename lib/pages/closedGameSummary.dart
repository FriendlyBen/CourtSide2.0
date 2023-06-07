import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClosedGameSummary extends StatelessWidget {
  static const String apiKey = 'rkcd9u7zu893xzms99pdmxtf';
  final String gameID;

  ClosedGameSummary({Key? key, required this.gameID}) : super(key: key);

  Future<dynamic> fetchGameSummary() async {
    String apiUrl =
        'http://api.sportradar.us/nba/trial/v8/en/games/$gameID/summary.json?api_key=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(), // Add a title
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: fetchGameSummary(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final gameSummary = snapshot.data;
              final homeAlias = gameSummary['home']['alias'];
              final awayAlias = gameSummary['away']['alias'];
              final homePoint = gameSummary['home']['points'];
              final awayPoint = gameSummary['away']['points'];
              final homeFGM =
                  gameSummary['home']['statistics']['field_goals_made'];
              final homeFGA =
                  gameSummary['home']['statistics']['field_goals_att'];
              final homeFGP =
                  gameSummary['home']['statistics']['field_goals_pct'];
              final awayFGM =
                  gameSummary['away']['statistics']['field_goals_made'];
              final awayFGA =
                  gameSummary['away']['statistics']['field_goals_att'];
              final awayFGP =
                  gameSummary['away']['statistics']['field_goals_pct'];
              final homeFTA =
                  gameSummary['home']['statistics']['free_throws_att'];
              final homeFTM =
                  gameSummary['home']['statistics']['free_throws_made'];
              final homeFTP =
                  gameSummary['home']['statistics']['field_goals_pct'];
              final awayFTA =
                  gameSummary['away']['statistics']['free_throws_att'];
              final awayFTM =
                  gameSummary['away']['statistics']['free_throws_made'];
              final awayFTP =
                  gameSummary['away']['statistics']['field_goals_pct'];
              final homeDR =
                  gameSummary['home']['statistics']['defensive_rebounds'];
              final homeOR =
                  gameSummary['home']['statistics']['offensive_rebounds'];
              final awayDR =
                  gameSummary['away']['statistics']['defensive_rebounds'];
              final awayOR =
                  gameSummary['away']['statistics']['offensive_rebounds'];
              final homeAssist = gameSummary['home']['statistics']['assists'];
              final awayAssist = gameSummary['away']['statistics']['assists'];
              final homeSteals = gameSummary['home']['statistics']['steals'];
              final awaySteals = gameSummary['away']['statistics']['steals'];
              final homeBlocks = gameSummary['home']['statistics']['blocks'];
              final awayBlocks = gameSummary['away']['statistics']['blocks'];
              final homeTotalFouls =
                  gameSummary['home']['statistics']['total_fouls'];
              final awayTotalFouls =
                  gameSummary['away']['statistics']['total_fouls'];
              final homeTurnovers =
                  gameSummary['home']['statistics']['total_turnovers'];
              final awayTurnovers =
                  gameSummary['away']['statistics']['total_turnovers'];
              final homeBiggestLead =
                  gameSummary['home']['statistics']['biggest_lead'];
              final awayBiggestLead =
                  gameSummary['away']['statistics']['biggest_lead'];
              final homeBenchPoints =
                  gameSummary['home']['statistics']['bench_points'];
              final awayBenchPoints =
                  gameSummary['away']['statistics']['bench_points'];
              final homeOffensiveRating =
                  gameSummary['home']['statistics']['offensive_rating'];
              final awayOffensiveRating =
                  gameSummary['away']['statistics']['offensive_rating'];
              final homeDefensiveRating =
                  gameSummary['home']['statistics']['defensive_rating'];
              final awayDefensiveRating =
                  gameSummary['away']['statistics']['defensive_rating'];

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 174, 200, 245),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20))),
                        height: 200,
                        width: 400,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 100,
                                  width: 100,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/team/$homeAlias.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 100,
                                  width: 100,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/team/$awayAlias.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                homePoint > awayPoint
                                    ? Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.all(10),
                                        child: Text(homePoint.toString(),
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500)),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.all(10),
                                        child: Text(homePoint.toString(),
                                            style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                homePoint > awayPoint
                                    ? Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.all(10),
                                        child: Text(awayPoint.toString(),
                                            style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500)),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: const EdgeInsets.all(10),
                                        child: Text(awayPoint.toString(),
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w500)),
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: 560,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400),
                                    'Statistics')
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5), //field goal
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeFGP% [$homeFGM/$homeFGA]'),
                                const Text('Field Goal'),
                                Text('$awayFGP% [$awayFGM/$awayFGA]'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5), //free throw
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeFTP% [$homeFTM/$homeFTA]'),
                                const Text('Free Throw'),
                                Text('$awayFTP% [$awayFTM/$awayFTA]'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeDR'),
                                const Text('Defensive rebounds'),
                                Text('$awayDR'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeOR'),
                                const Text('Offensive Rebounds'),
                                Text('$awayOR'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeSteals'),
                                const Text('Steals'),
                                Text('$awaySteals'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeAssist'),
                                const Text('Assists'),
                                Text('$awayAssist'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeBlocks'),
                                const Text('Blocks'),
                                Text('$awayBlocks'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeTurnovers'),
                                const Text('Turnovers'),
                                Text('$awayTurnovers'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeTotalFouls'),
                                const Text('Fouls'),
                                Text('$awayTotalFouls'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeBiggestLead'),
                                const Text('Biggest Lead'),
                                Text('$awayBiggestLead'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('$homeBenchPoints'),
                                const Text('Bench Points'),
                                Text('$awayBenchPoints'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('${homeOffensiveRating.toStringAsFixed(2)}'),
                                const Text('Offensive Rating'),
                                Text('${awayOffensiveRating.toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('${homeDefensiveRating.toStringAsFixed(2)}'),
                                const Text('Defensive Rating'),
                                Text('${awayDefensiveRating.toStringAsFixed(2)}'),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
