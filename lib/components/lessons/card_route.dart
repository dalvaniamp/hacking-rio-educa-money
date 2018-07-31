import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miverva_app/components/lessons/card.dart';
import 'package:miverva_app/components/lessons/card_tile.dart';

class LessonRoute extends StatefulWidget {
  final List<CustomCard> listCards;

  const LessonRoute({
    Key key,
    @required this.listCards,
  }) : assert(listCards != null);

  @override
  State createState() => new LessonRouteState();
}

class LessonRouteState extends State<LessonRoute> {
  int cardId = 0;
  int _counterCard = 0;
  List<CustomCard> cards;
  bool _lastCard = false;
  Color _backgroundColor = Colors.green;

  @override
  void initState() {
    super.initState();
    _setDefaults();
  }

  void _setDefaults() {
    setState(() {
      cards = widget.listCards;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new GestureDetector(

          child: new Dismissible(
              resizeDuration: null,
              onDismissed: (DismissDirection direction) {
                setState(() {
                  updateCard(direction);
                });
              },
              key: new Key("key" + Random().nextInt(10000).toString()),
              child: new CardTile(card: widget.listCards[_counterCard],))
        )

    );
  }

  void updateCard(DismissDirection direction){
    if(direction == DismissDirection.endToStart){
      if(_counterCard == widget.listCards.length - 1){
        _lastCard = true;
        return;
      }
      _counterCard += 1;
    }
    else if (direction == DismissDirection.startToEnd){
      if(_counterCard != 0) {
        _counterCard -= 1;
      }
    }
  }
}
