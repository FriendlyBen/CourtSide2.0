import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class LiveGameScreen extends StatefulWidget {
  @override
  _LiveGameScreenState createState() => _LiveGameScreenState();
}

class _LiveGameScreenState extends State<LiveGameScreen> {
  final channel = IOWebSocketChannel.connect('wss://api.example.com/live');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Process and display the received data in your UI
          final data = snapshot.data;
          return Text(data.toString());
        } else if (snapshot.hasError) {
          // Handle any errors that occurred
          return Text('Error: ${snapshot.error}');
        } else {
          // Display a loading indicator or initial state
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }
}
