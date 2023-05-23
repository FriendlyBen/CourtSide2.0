import 'package:flutter/material.dart';

class LiveGamePage extends StatefulWidget {
  final String gameID;

  const LiveGamePage({Key? key, required this.gameID}) : super(key: key);

  @override
  _LiveGamePageState createState() => _LiveGamePageState();
}

class _LiveGamePageState extends State<LiveGamePage> {
  @override
  Widget build(BuildContext context) {

    print(widget.gameID);
    return Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(margin: const EdgeInsets.only(left: 20),
        child: Text(style: TextStyle(fontSize: 20), widget.gameID),
      ),
    ]);
  }
}
