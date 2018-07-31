import 'package:flutter/material.dart';
import 'dart:core';
import 'package:meta/meta.dart';
import 'package:miverva_app/components/generics/video.dart';
import 'package:miverva_app/components/lessons/card.dart';

class CardTile extends StatelessWidget {
  final CustomCard card;
  const CardTile({
    Key key,
    @required this.card,
  })  : assert(card != null),
        super(key: key);

  Widget _buildContainerWidgets(BuildContext context) {
    return new Material(
      elevation: card.cardElevation,
      color: Colors.white,
      child: new Container(
          margin: EdgeInsets.all(05.0),
          child: new Column(
            children: _createTextWidgets(context),
          )),
    );
  }

  List<Widget> _createTextWidgets(BuildContext context) {
    List<Widget> listWidget = new List<Widget>();

    listWidget.add(new Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: new Container(
          height: 60.0,
          width: 60.0,
          child: new Image.asset(card.iconBaseLocation),
        )));

    if (card.title != null) {
      listWidget.add(
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            card.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu',
                ),
          ),
        ),
      );
    }

    if (card.iconImageLocation != null) {
      if (card.iconImageLocation.contains("assets")) {
        listWidget.add(
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: new Image.asset(card.iconImageLocation),
          ),
        );
      }

      if (card.iconImageLocation.contains("http")) {
        listWidget.add(new Container(
          height: 200.0,
          width: 300.0,
          child: VideoDemo(
              title: "Video tutorial",
              description: "Video descritivo",
              uri: card.iconImageLocation),
        ));
      }
    }

    if (card.text != null) {
      listWidget.add(
        new Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Text(card.text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline.copyWith(
                    color: Colors.black87,
                    fontFamily: 'Ubuntu',
                    fontSize: 22.0,
                  )),
        ),
      );
    }

    if (card.questions != null) {
      List<String> stringList = card.questions.split('*');
      List<Widget> children = new List<Widget>();
      for (int i = 0; i < stringList.length; i++) {
        children.add(new Container(
            height: 100.0,
            width: 280.0,
            child: new Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: new RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    stringList[i],
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  padding: EdgeInsets.all(5.0),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/"+card.routeUrl);
                  },
                ))));
      }

      listWidget.add(new Container(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children)));
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: _buildContainerWidgets(context));
  }
}
