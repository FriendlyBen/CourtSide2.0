import 'package:flutter/material.dart';

class ClosedGameSummary extends StatelessWidget{

  final String gameID;

  const ClosedGameSummary({Key ? key, required this.gameID}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    print(gameID);
    return Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(margin: const EdgeInsets.only(left: 20),
        child: Text(style: TextStyle(fontSize: 20), gameID),
      ),
    ]);
  }
  
  }