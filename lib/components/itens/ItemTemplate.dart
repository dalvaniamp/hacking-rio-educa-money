import 'package:flutter/material.dart';
import 'package:miverva_app/components/itens/Item.dart';

class Comida extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Comida"),
        ),
      body:new ListView(
        children: <Widget>
        [
          new ItemRow("Abacate"),
          new ItemRow("Banana"),
          new ItemRow("Morango"),
          new ItemRow("Pizza"),
        ],

      )
    );
    ;
  }
}

class Lazer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Lazer"),
      ),

      body:new ListView(
        children: <Widget>
        [
          new ItemRow("Bola"),
          new ItemRow("Videogame"),
        ],
      ),
    );
  }
}

class Estudos extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Lazer"),
      ),
      body:new ListView(
        children: <Widget>
        [
          new ItemRow("Livro"),
          new ItemRow("Dicionário"),
        ],
      ),
    );
  }
}

class Saude extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Saúde"),
      ),
      body:new ListView(
        children: <Widget>
        [
          new ItemRow("Remédio"),
          new ItemRow("Curativo"),
          new ItemRow("Escova"),
        ],
      ),
    );
  }
}

