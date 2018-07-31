import 'package:flutter/material.dart';
import 'package:miverva_app/components/lessons/card.dart';
import 'package:miverva_app/components/lessons/page_selector.dart';

class GenericAchievementComponent extends StatelessWidget {
  GenericAchievementComponent(
    this.title,
    this.imagePath,
    this.complete, [
      this.lesson,
    this.titleSize = 14.0,
    this.descriptionSize = 14.0,
    this.imageSize = 70.0,
    this.titleColor = Colors.black,
  ]);
  VoidCallback callbackOnTap;
  String title;
  String imagePath;
  String complete;
  double titleSize;
  double descriptionSize;
  double imageSize;
  Color titleColor;
  String lesson;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          new Text(title,
              style: new TextStyle(
                  fontSize: titleSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: titleColor)),
          new Material(
              elevation: 4.0,
              shape: CircleBorder(),
              child: Ink.image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  width: imageSize,
                  height: imageSize,
                  child: InkWell(onTap: () {
                    Navigator.pushNamed(context, lesson);
                  }))),
          new Text(complete,
              style: new TextStyle(
                  fontSize: descriptionSize,
                  fontFamily: 'Roboto',
                  color: titleColor))
        ]));
  }
}
