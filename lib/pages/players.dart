import 'package:flutter/material.dart';
import 'package:courtside_version_2/widgets/horiScrollbar.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          HorizontalScrollBar(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container( margin: const EdgeInsets.all(5),
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
                      child: Container( margin: const EdgeInsets.all(5),
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
          ),
        ],
      ),
    );
  }
}
