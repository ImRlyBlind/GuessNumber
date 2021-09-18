
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guess_number/pages/game/game.dart';

class GamePage2 extends StatefulWidget {
  const GamePage2({Key? key}) : super(key: key);

  @override
  _GamePage2State createState() => _GamePage2State();
}

class _GamePage2State extends State<GamePage2> {
  late Game _game;
  final _controller = TextEditingController();
  String? _guessNumber;
  String? _feedback;
  late int _result;
  late String _text = '';

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _reset() {
    setState(() {
      _game = Game();
      _feedback = null;
      _guessNumber = null;
      _text = '';
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: Container(
        color: Colors.pink.withAlpha(50),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHeader(),
                _buildMainContent(),
                _buildInputPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/logo_number.png',
          width: 240, //96 pixel = 1 inch
        ),
        Text(
          "GUESS THE NUMBER",
          style: GoogleFonts.kanit(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent() {
    return _guessNumber == null
        ? Center(
            child: Column(
              children: [
                Text(
                  "I'm thinking of a number",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'between 1 and 100\n',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Can you guess it? ',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 35,
                    )
                  ],
                ),
              ],
            ),
          )
        : Column(
            children: [
              Text(
                _guessNumber!,
                style: GoogleFonts.kanit(fontSize: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _result == 1 || _result == -1
                      ? Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 50,
                        )
                      : Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 50,
                        ),
                  Text(
                    _feedback!,
                    style: GoogleFonts.kanit(fontSize: 50),
                  ),
                ],
              ),
              _result == 0
                  ? TextButton(
                      onPressed: () {
                        _reset();
                      },
                      child: Text('NEW GAME'),
                    )
                  : SizedBox.shrink(),
            ],
          );
  }

  Widget _buildInputPanel() {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  /*enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)
                            ),*/
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 10),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _guessNumber = _controller.text;
                  int? guess = int.tryParse(_guessNumber!);
                  if (guess != null) {
                    _result = _game.doGuess(guess);
                    if (_result == 0) {
                      _feedback = 'CORRECT!';
                      _text += _guessNumber!;
                      _controller.clear();
                      _showMaterialDialog(
                          'GOOD JOB!', 'The answer is ${_game.answer}.\n'
                          'You have made ${_game.totalGuesses} guesses.\n\n'
                          '$_text'
                      );
                    } else if (_result == 1) {
                      _feedback = 'TOO HIGH!';
                      _text += _guessNumber! + ' -> ';
                      _controller.clear();
                    } else {
                      _feedback = 'TOO LOW!';
                      _text += _guessNumber! + ' -> ';
                      _controller.clear();
                    }
                  }
                });
              },
              child: Text('GUESS'),
            ),
          ],
        ),
      ),
    );
  }



  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
