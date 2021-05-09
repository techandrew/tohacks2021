import 'ai.dart';
import 'package:muggles/screens/game/singlePlayerGame.dart';

class EasyAI extends AI {
  @override
  List<int> getMove(List<List<GameState>> board, int turns) {
    var emptyCells = getEmptyCells(board);
    print(emptyCells);
    return emptyCells[0];
  }
}