import 'package:flutter/material.dart';
import 'package:miverva_app/components/itens/ItemCategory.dart';


class Loja extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Loja"),
      ),

      body:new ListView(
        children: <Widget>
        [
          new ItemCategory("Comida"),
          new ItemCategory("Lazer"),
          new ItemCategory("Estudos"),
          new ItemCategory("Saúde"),

        ],
      ),
    );
  }
}