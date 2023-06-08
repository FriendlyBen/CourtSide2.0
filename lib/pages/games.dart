import 'package:flutter/material.dart';
import 'package:courtside_version_2/apiStore/getGames.dart';
import 'package:courtside_version_2/apiStore/getLiveGames.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  static const String apiKey = 'rkcd9u7zu893xzms99pdmxtf';

  late Future<dynamic>? gameDataFuture;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    // Set the initial selected date to the current date
    selectedDate = DateTime.now();
    gameDataFuture = fetchData(selectedDate);
  }

  Future<dynamic> fetchData(DateTime date) async {
    String apiUrl =
        'http://api.sportradar.us/nba/trial/v8/en/games/${date.year}/${date.month}/${date.day}/schedule.json?api_key=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2024),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        gameDataFuture = fetchData(selectedDate);
      });
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
                  color: Colors.blueAccent.withOpacity(0.1),
                ),
                margin: const EdgeInsets.all(10),
                width: 500,
                height: 40,
                child: TextButton(
                  onPressed: () => _selectDate(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 8),
                      Text(
                        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
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
          ),
        ),
      ),
    );
  }
}
