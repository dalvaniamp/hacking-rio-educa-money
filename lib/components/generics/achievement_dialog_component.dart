import 'package:flutter/material.dart';
import 'package:miverva_app/components/generics/generic_achievement_component.dart';

class AchievementDialog extends StatelessWidget {
  AchievementDialog(this.title, this.imagePath, this.description,
      [this.titleSize = 20.0,
      this.descriptionSize = 20.0,
      this.imageSize = 80.0,
      this.titleColor = Colors.black]);

  final String title;
  final String description;
  final String imagePath;
  final double titleSize;
  final double descriptionSize;
  final double imageSize;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: new SingleChildScrollView(
        child: new Material(
          child: new Column(children: <Widget>[
            new GenericAchievementComponent(title, imagePath, description, "/", titleSize,
                descriptionSize, imageSize),
            new RaisedButton(
              child: Text('OK'),
              padding: EdgeInsets.all(5.0),
              onPressed: () {
                // Navigate to the second screen using a named route
                Navigator.pop(context);
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class AchievementDialogBox {
  AchievementDialog build() {
    return new AchievementDialog('Seu troféu!', 'assets/icons/trofeu.png', 'Parabéns.');
  }
}
