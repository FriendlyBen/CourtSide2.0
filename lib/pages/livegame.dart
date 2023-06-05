import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LiveGamePage extends StatefulWidget {
  final String gameID;

  const LiveGamePage({Key? key, required this.gameID}) : super(key: key);

  @override
  _LiveGamePageState createState() => _LiveGamePageState();
}

class _LiveGamePageState extends State<LiveGamePage> {
  StreamController<dynamic> streamController = StreamController<dynamic>();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    streamController.close();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      fetchData();
    });
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
        'http://api.sportradar.us/nba/trial/v8/en/games/${widget.gameID}/summary.json?api_key=rkcd9u7zu893xzms99pdmxtf',
      ),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (!streamController.isClosed) {
        streamController.add(jsonData); // Pass the decoded jsonData as is
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final liveGameData = snapshot.data;
              final homePoint =
                  liveGameData['home']['statistics']['points'].toString();
              final awayPoint =
                  liveGameData['away']['statistics']['points'].toString();
              print(homePoint);
              print(awayPoint);
              final quarter = liveGameData['quarter'];
              final clock = liveGameData['clock'];
              print(clock);
              return Center(
                child: Column(
                  children: [
                    Text('Quarter: $quarter'),
                    Text('Time Left: $clock'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Home: $homePoint'),
                        Text('Away: $awayPoint'),
                      ],
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
