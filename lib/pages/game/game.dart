//import 'dart:io';
import 'dart:math';

class Game {
  final int _answer;
  int _totalGuesses = 0;

  Game() : _answer = Random().nextInt(100) + 1{
    print('Game constructor = $_answer');
  }

  int doGuess(int num) {
    _totalGuesses++;
    return num > _answer
        ? 1
        : num < _answer
            ? -1
            : 0;
  }

  /*int getTotalGuess(){
    return _totalGuesses;
  }*/
  int get totalGuesses{
    return _totalGuesses;
  }
  int get answer{
    return _answer;
  }
}
