import 'package:courtside_version_2/apiStore/getGames.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

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
                    color: Colors.grey[400],
                  ),
                  margin: const EdgeInsets.all(10),
                  width: 500,
                  height: 40,
                  child: const Center(
                    child: Text('This is for the date bar'),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(style: TextStyle(fontSize: 25), 'Today'),
                  ],
                ),
              ),
              Container( // this is live match container
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent,
                  ),
                  margin: const EdgeInsets.all(10),
                  width: 500,
                  height: 200,
                  child: const Center(
                    child: Text("This is for live matches"),
                  ),
                ),
              ),
              Container(//margin: const EdgeInsets.all(10), padding: const EdgeInsets.all(10),color: Colors.black,//this is for scheduled / closed game
                child: const GetGames(),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.grey.withOpacity(0.6),
              //   ),
              //   margin: const EdgeInsets.all(10),
              //   width: 500,
              //   height: 100,
              //   child: const Center(
              //     child: Text("This is for scheduled match"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
