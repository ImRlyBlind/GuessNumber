import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePage2 extends StatefulWidget {
  const GamePage2({Key? key}) : super(key: key);

  @override
  _GamePage2State createState() => _GamePage2State();
}

class _GamePage2State extends State<GamePage2> {
  var str = 'Kanit';
  var textFont = 1;
  Widget text = Text(
    'การเดินทางขากลับคงจะเหงาน่าดู',
    style: GoogleFonts.kanit(fontSize: 40),
    textAlign: TextAlign.center,
  );

  _changeFont(int i) {
    setState(() {
      textFont = i;
      if (textFont == 1) {
        str = 'Kanit';
        text = Text(
          'การเดินทางขากลับคงจะเหงาน่าดู',
          style: GoogleFonts.kanit(fontSize: 40),
          textAlign: TextAlign.center,
        );
      } else if (textFont == 2) {
        str = 'Sriracha';
        text = Text(
          'การเดินทางขากลับคงจะเหงาน่าดู',
          style: GoogleFonts.sriracha(fontSize: 40),
          textAlign: TextAlign.center,
        );
      } else if (textFont == 3) {
        str = 'Itim';
        text = Text(
          'การเดินทางขากลับคงจะเหงาน่าดู',
          style: GoogleFonts.itim(fontSize: 40),
          textAlign: TextAlign.center,
        );
      } else if (textFont == 4) {
        str = 'Pattaya';
        text = Text(
          'การเดินทางขากลับคงจะเหงาน่าดู',
          style: GoogleFonts.pattaya(fontSize: 40),
          textAlign: TextAlign.center,
        );
      } else if (textFont == 5) {
        str = 'Athiti';
        text = Text(
          'การเดินทางขากลับคงจะเหงาน่าดู',
          style: GoogleFonts.athiti(fontSize: 40),
          textAlign: TextAlign.center,
        );
      }
    });
  }

  Widget _showMessage() {
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THAI FONT VIEWER'),
        backgroundColor: Colors.red.withAlpha(100),
      ),
      backgroundColor: Colors.green.withAlpha(50),
      body: Container(
        child: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _showMessage(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Font: ' + str,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5.0,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            alignment: WrapAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () => _changeFont(1),
                                  child: Text('Kanit'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () => _changeFont(2),
                                  child: Text('Sriracha'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () => _changeFont(3),
                                  child: Text('Itim'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () => _changeFont(4),
                                  child: Text('Pattaya'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () => _changeFont(5),
                                  child: Text('Athiti'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
