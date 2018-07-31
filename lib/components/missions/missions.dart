import 'package:flutter/material.dart';
import 'package:miverva_app/components/itens/Item.dart';

class MissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Missões"),
        ),
        body: new ListView(
          children: <Widget>[
            new Container(height: 20.0,),
            new ItemRow("Desafios")
          ],
        ));
  }
}
