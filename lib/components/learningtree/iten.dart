import 'package:flutter/material.dart';
import 'package:miverva_app/components/generics/generic_achievement_component.dart';
import 'package:miverva_app/components/generics/achievement_dialog_component.dart';
import 'package:miverva_app/components/lessons/card.dart';

class LearningTreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carreira"),
        ),
        body:  TheGridView().build());
  }
}

class TheGridView {

  Container build() {
    return new Container(
      color: Colors.white,
        child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 20.0,
        children: <Widget>[
          new Container(),
          GenericAchievementComponent('Introdução 1', 'assets/icons/growth.png', '0%', "/cardone" ),
          new Container(),
          new Container(),
          GenericAchievementComponent('Introdução 2', 'assets/icons/growth.png', '0%', "/cardtwo"),
          new Container(),
          new Container(),
          GenericAchievementComponent('Introdução 3', 'assets/icons/growth.png', '0%', "/cardthree"),
          new Container(),
          new Container(),
          GenericAchievementComponent('Planejamento 1', 'assets/icons/graph.png', '0%'),
          GenericAchievementComponent('Bancos 1', 'assets/icons/building.png', '0%'),
          new Container(),
          GenericAchievementComponent('Planejamento 2', 'assets/icons/graph.png', '0%'),
          GenericAchievementComponent('Bancos 2', 'assets/icons/building.png', '0%'),
          GenericAchievementComponent('Cooperativismo 1', 'assets/icons/teamwork.png', '0%'),
          GenericAchievementComponent('Planejamento 3', 'assets/icons/graph.png', '0%'),
          GenericAchievementComponent('Bancos 3', 'assets/icons/building.png', '0%'),
          GenericAchievementComponent('Cooperativismo 2', 'assets/icons/teamwork.png', '0%'),
          GenericAchievementComponent('Planejamento 4', 'assets/icons/graph.png', '0%'),
          GenericAchievementComponent('Bancos 4', 'assets/icons/building.png', '0%'),
          GenericAchievementComponent('Cooperativismo 3', 'assets/icons/teamwork.png', '0%'),
          GenericAchievementComponent('Planejamento 5', 'assets/icons/graph.png', '0%'),
          GenericAchievementComponent('Bancos 5', 'assets/icons/building.png', '0%'),
        ]));
  }
}
