import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sensors/sensors.dart';
import 'dart:async';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Cheating Dice'),
          backgroundColor: Colors.teal,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with SingleTickerProviderStateMixin{

  var _random = Random.secure();
  var _diceImage1 = 'images/dice6.png';
  var _diceImage2 = 'images/dice6.png';
  var _diceImage3 = 'images/dice6.png';
  var _diceImage4 = 'images/dice6.png';
  var _diceImage5 = 'images/dice6.png';
  var _diceImage6 = 'images/dice6.png';

  AnimationController _controller;

  final Tween<double> _turnsTween = Tween<double>(
    begin: 1,
    end: 3,
  );

  @override
  void initState() {
    super.initState();

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        if((event.x>1 || event.x<-1) && (event.y>1 || event.y<-1))
        {
          _rollDices();
        }
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      upperBound: pi * 2,
      animationBehavior: AnimationBehavior.normal
    );
  }

  Future<void> _onTap() async{
    await _rollDices();
  }

  Future<void> _rollDices() async{

    await _controller.forward();

    setState(() {
      int min = 1, max = 7;
      int diceNumber = 0;

      diceNumber = min + _random.nextInt(max - min);
      _diceImage1 = 'images/dice$diceNumber.png';

      diceNumber = min + _random.nextInt(max - min);
      _diceImage2 = 'images/dice$diceNumber.png';

      diceNumber = min + _random.nextInt(max - min);
      _diceImage3 = 'images/dice$diceNumber.png';

      diceNumber = min + _random.nextInt(max - min);
      _diceImage4 = 'images/dice$diceNumber.png';

      diceNumber = min + _random.nextInt(max - min);
      _diceImage5 = 'images/dice$diceNumber.png';

      diceNumber = min + _random.nextInt(max - min);
      _diceImage6 = 'images/dice$diceNumber.png';
    });

    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RotationTransition(
                turns: _turnsTween.animate(_controller),
                child: Image(
                    width: 150,
                    height: 150,
                    image: AssetImage(_diceImage1)
                ),
              ),
              SizedBox(width: 10,),
              RotationTransition(
                turns: _turnsTween.animate(_controller),
                child: Image(
                    width: 150,
                    height: 150,
                    image: AssetImage(_diceImage2)
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RotationTransition(
                turns: _turnsTween.animate(_controller),
                child: Image(
                    width: 150,
                    height: 150,
                    image: AssetImage(_diceImage3)
                ),
              ),
              SizedBox(width: 10,),
              RotationTransition(
                turns: _turnsTween.animate(_controller),
                child: Image(
                    width: 150,
                    height: 150,
                    image: AssetImage(_diceImage4)
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RotationTransition(
                turns: _turnsTween.animate(_controller),
                child: Image(
                    width: 150,
                    height: 150,
                    image: AssetImage(_diceImage5)
                ),
              ),
              SizedBox(width: 10,),
              RotationTransition(
                turns: _turnsTween.animate(_controller),
                child: Image(
                    width: 150,
                    height: 150,
                    image: AssetImage(_diceImage6)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


