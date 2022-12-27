import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: PageDice(),
      ),
    ),
  );
}

class PageDice extends StatefulWidget {
  @override
  State<PageDice> createState() => _PageDiceState();
}

//statefull widgets are mutable
//in order to get random numbers, we need to use dart random library
class _PageDiceState extends State<PageDice> {
  int LeftDicenummer = 1;
  int RightDicenummer = 1;
  void num_change() {
    RightDicenummer = Random().nextInt(3) + 1;
    LeftDicenummer = Random().nextInt(3) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  // it is used to instantaneously do the changes, if it is not used then hot reload will build the app again, and do the changes
                  //dekh setstate se hoga kya..k yeh mark kr dega k koi change hua(her nummer), and poore app mei vo changes kr dega
                  num_change();
                  print('Dicenummer=$LeftDicenummer');
                });
              },
              child: Image.asset('images/dice$LeftDicenummer.png'),
            ),
          ), //another way to write image
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  num_change();
                  print('Dicenummer=$RightDicenummer');
                });
              },
              child: Image.asset('images/dice$RightDicenummer.png'),
            ),
          ),
        ],
      ),
    );
  }
}
