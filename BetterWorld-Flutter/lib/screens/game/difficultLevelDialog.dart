import 'package:flutter/material.dart';
import 'singlePlayerGame.dart';

import 'ai/ai.dart';

class DifficultyLevelDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Choose a level',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            ListTile(
              title: Text(
                'Rookie',
                style: TextStyle(fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SinglePlayerGame(
                            difficulty: GameDifficulty.Easy,
                          ),
                    ),
                  ),
            ),
            ListTile(
              title: Text(
                'Professional',
                style: TextStyle(fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),
              onTap: ()=>Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SinglePlayerGame(
                            difficulty: GameDifficulty.Easy,
                          ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
