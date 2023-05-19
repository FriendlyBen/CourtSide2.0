import 'package:courtside_version_2/widgets/gameContainer.dart';
import 'package:flutter/material.dart';

class GetGames extends StatelessWidget {
  final dynamic gameData;

  GetGames({Key? key, required this.gameData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(gameData['games'].length, (index) {
        var gameData2 = gameData['games'][index];
        String? gameID = gameData2['id'];
        String? gameStatus = gameData2['status'];
        String? gameTitle = gameData2['title'];
        String? gameTime = gameData2['scheduled'];
        String? gameVenue = gameData2['venue']['name'];
        String? gameVenue2 = gameData2['venue']['city'];
        String? homeName = gameData2['home']['name'];
        String? homeAlias = gameData2['home']['alias'];
        String? awayName = gameData2['away']['name'];
        String? awayAlias = gameData2['away']['alias'];

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
