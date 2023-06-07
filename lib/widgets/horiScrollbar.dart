import 'package:flutter/material.dart';

class HorizontalScrollBar extends StatefulWidget {
  @override
  _HorizontalScrollBarState createState() => _HorizontalScrollBarState();
}

class _HorizontalScrollBarState extends State<HorizontalScrollBar> {
  int selectedIndex = 0;

  // Example list of team names
  List<String> teamNames = [
    'ATL',
    'BKN',
    'BOS',
    'CLE',
    'DEN',
    'GSW',
    'LAC',
    'LAL',
    'MEM',
    'MIA',
    'MIL',
    'MIN',
    'NYK',
    'PHI',
    'PHX',
    'SAC',
  ];

  String getTeamImagePath(String teamName) {
    // Generate the image path based on the team name
    return 'assets/team/$teamName.png';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: teamNames.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          double margin = isSelected ? 0.0 : 5.0;

          String teamName = teamNames[index];
          String imagePath = getTeamImagePath(teamName);

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: isSelected ? 100.0 : 60.0, // Adjust the width directly
              height: isSelected ? 100.0 : 60.0, // Adjust the height directly
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                border: Border.all(color: isSelected ? Colors.blueAccent : Colors.transparent,
                width: 10)
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
