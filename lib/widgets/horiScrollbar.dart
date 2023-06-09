import 'package:flutter/material.dart';

class HorizontalScrollBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTeamSelected;

  const HorizontalScrollBar({
    required this.selectedIndex,
    required this.onTeamSelected,
  });

  @override
  _HorizontalScrollBarState createState() => _HorizontalScrollBarState();
}

class _HorizontalScrollBarState extends State<HorizontalScrollBar> {
  // Example list of team names
  List<String> teamNames = [
    'ATL',
    'BKN',
    'BOS',
    'CHA',
    'CHI',
    'CLE',
    'DAL',
    'DEN',
    'DET',
    'GSW',
    'HOU',
    'IND',
    'LAC',
    'LAL',
    'MEM',
    'MIA',
    'MIL',
    'MIN',
    'NOP',
    'NYK',
    'OKC',
    'ORL',
    'PHI',
    'PHX',
    'POR',
    'SAC',
    'SAS',
    'TOR',
    'UTA',
    'WAS'
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
          bool isSelected = index == widget.selectedIndex;
          double margin = isSelected ? 0.0 : 5.0;

          String teamName = teamNames[index];
          String imagePath = getTeamImagePath(teamName);

          return GestureDetector(
            onTap: () {
              widget.onTeamSelected(index);
            },
            child: Container(
              width: isSelected ? 100.0 : 60.0,
              height: isSelected ? 100.0 : 60.0,
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
                border: Border.all(
                  color: isSelected ? Colors.blueAccent : Colors.transparent,
                  width: 10,
                ),
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

