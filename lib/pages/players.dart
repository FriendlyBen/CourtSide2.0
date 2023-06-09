import 'package:flutter/material.dart';
import 'package:courtside_version_2/apiStore/teamID.dart';
import 'package:courtside_version_2/widgets/horiScrollbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlayersPage extends StatefulWidget {
  const PlayersPage({Key? key}) : super(key: key);

  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  List<String> teamValues = teamId.values.toList();

  static const apiKey = 'rkcd9u7zu893xzms99pdmxtf';

  late Future<dynamic>? teamDataFuture;
  late int selectedTeam = 0; // Set default selected team to the first index

  Future<dynamic> teamData(String teamID) async {
    String apiUrl =
        'http://api.sportradar.us/nba/trial/v8/en/teams/$teamID/profile.json?api_key=$apiKey';

    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    teamDataFuture = teamData(teamValues[selectedTeam]);
  }

  void updateSelectedTeam(int index){
    setState(() {
      selectedTeam = index;
      teamDataFuture = teamData(teamValues[selectedTeam]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          HorizontalScrollBar(selectedIndex: selectedTeam, onTeamSelected: updateSelectedTeam),
          const SizedBox(height: 20),
          FutureBuilder<dynamic>(
              future: teamDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error occured');
                } else {
                  final dynamic legitTeamData = snapshot.data;
                  print(legitTeamData);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                height: 100,
                                alignment: Alignment.center,
                                color: index % 2 == 0
                                    ? Colors.grey[200]
                                    : Colors.grey[300],
                                child: Text(
                                  'Row ${index + 1}, Column 1',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                height: 100,
                                alignment: Alignment.center,
                                color: index % 2 == 0
                                    ? Colors.grey[300]
                                    : Colors.grey[400],
                                child: Text(
                                  'Row ${index + 1}, Column 2',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
