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
    return FutureBuilder(
      future: fetchGameSummary(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final gameSummary = snapshot.data;
          final homeAlias = gameSummary['home']['alias'];
          final awayAlias = gameSummary['away']['alias'];
          final homePoint = gameSummary['home']['points'];
          final awayPoint = gameSummary['away']['points'];

          print(gameSummary);
          print(homeAlias);

          return Scaffold(
            appBar: AppBar(),
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
                        child: Text('This is the closed game summary page'),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: 400,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  // color: Colors.black,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/team/$homeAlias.png'),
                                            fit: BoxFit.contain)),
                                  )),
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  // color: Colors.black,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/team/$awayAlias.png'),
                                            fit: BoxFit.contain)),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(homePoint.toString()),
                              Text(awayPoint.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
