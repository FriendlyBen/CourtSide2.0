import 'package:flutter/material.dart';
import 'package:courtside_version_2/widgets/liveGameContainers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/gameContainer.dart';

class GetLiveGames extends StatefulWidget {
  final dynamic data;

  const GetLiveGames({Key? key, required this.data}) : super(key: key);

  @override
  _GetLiveGamesState createState() => _GetLiveGamesState();
}

class _GetLiveGamesState extends State<GetLiveGames> {
  dynamic liveGameData;

  @override
  void initState() {
    super.initState();
    liveGameData = widget.data;
  }

@override
Widget build(BuildContext context) {
  bool hasLiveGames = false;
  List<Widget> gameWidgets = [];
  
  for (int index = 0; index < liveGameData['games'].length; index++) {
    var liveGameData2 = liveGameData['games'][index];
    String? gameID = liveGameData2['id'];
    String? gameStatus = liveGameData2['status'];
    String? gameTitle = liveGameData2['title'];
    String? gameTime = liveGameData2['scheduled'];
    String? gameVenue = liveGameData2['venue']['name'];
    String? gameVenue2 = liveGameData2['venue']['city'];
    String? homeName = liveGameData2['home']['name'];
    String? homeAlias = liveGameData2['home']['alias'];
    String? awayName = liveGameData2['away']['name'];
    String? awayAlias = liveGameData2['away']['alias'];

    if (gameStatus == 'inprogress') {
      hasLiveGames = true;
      gameWidgets.add(
        liveGameContainers(
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
        ),
      );
    }
  }

  if (!hasLiveGames) {
    gameWidgets.add(const NoLiveGameToday());
  }

  return Column(
    children: gameWidgets,
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
            color: Colors.blueAccent.withOpacity(0.6),
          ),
          child: Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue[100],
            ),
            child: const Center(child: Text('No Live Games Today')),
          ),
        ),
      ],
    );
  }
}
