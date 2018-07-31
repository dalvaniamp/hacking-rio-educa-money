import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CustomCard {
  final cardElevation = 5.0;
  final String title;
  final String text;
  final String iconBaseLocation;
  final String iconImageLocation;
  final String questions;
  final String routeUrl;
  final String achievementImageLocation;

  const CustomCard({
    Key key,
    this.title,
    this.text,
    @required this.iconBaseLocation,
    this.iconImageLocation,
    this.questions,
    this.routeUrl,
    this.achievementImageLocation,
  })
      : assert(iconBaseLocation != null);

  CustomCard.fromJson(Map jsonMap)
      : title = jsonMap['title'],
        text = jsonMap['text'],
        iconBaseLocation = jsonMap['iconBaseLocation'],
        routeUrl = jsonMap['routeUrl'],
        iconImageLocation = jsonMap['iconImageLocation'],
        achievementImageLocation = jsonMap['achievementImageLocation'],
        questions = jsonMap['questions'];
}
