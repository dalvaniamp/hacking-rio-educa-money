import 'package:flutter/material.dart';
import 'package:miverva_app/generic_model/player.dart';
import 'package:miverva_app/components/profile/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miverva_app/components/profile/custom_tooltip.dart';

class ReportScreen extends StatelessWidget {
  Player player;

  ReportScreen(this.player);

  Animation<Color> getBarColor(int value) {
    Color color = value / 100 < 0.5
        ? Colors.red
        : value / 100 < 0.8 ? Colors.yellow : Colors.green;
    return new AlwaysStoppedAnimation(color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView
          .count(crossAxisCount: 1, childAspectRatio: 2.5, children: <Widget>[
        ListView(padding: EdgeInsets.all(10.0),scrollDirection: Axis.vertical, children: [
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            new Icon(FontAwesomeIcons.utensils, size: 15.0),
            new Text("Alimentação",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline
                    .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold)),
            new CustomTooltip(
                message: "Alimentação",
                child: Icon(FontAwesomeIcons.questionCircle,
                    textDirection: TextDirection.rtl, size: 12.0)),
          ]),
          new IndicationBar(
              value: player.fome, valueColor: getBarColor(player.fome)),
          new Text(player.fome.toString() + "/100\n",
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize: 10.0,
                  )),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            new Icon(FontAwesomeIcons.solidPlusSquare, size: 15.0),
            new Text("Saúde",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline
                    .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold)),
            new CustomTooltip(
                message: "Saúde",
                child: Icon(FontAwesomeIcons.questionCircle,
                    textDirection: TextDirection.rtl, size: 12.0)),
          ]),
          new IndicationBar(
              value: player.saude, valueColor: getBarColor(player.saude)),
          new Text(player.saude.toString() + "/100\n",
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize: 10.0,
                  )),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            new Icon(FontAwesomeIcons.grinSquint, size: 15.0),
            new Text("Lazer",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline
                    .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold)),
            new CustomTooltip(
                message: "Lazer",
                child: Icon(FontAwesomeIcons.questionCircle,
                    textDirection: TextDirection.rtl, size: 12.0)),
          ]),
          new IndicationBar(
              value: player.lazer, valueColor: getBarColor(player.lazer)),
          new Text(player.lazer.toString() + "/100\n",
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize: 10.0,
                  )),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            new Icon(FontAwesomeIcons.bookOpen, size: 15.0),
            new Text("Conhecimento",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline
                    .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold)),
            new CustomTooltip(
                message: "Conhecimento utilizado para passar de nível",
                child: Icon(FontAwesomeIcons.questionCircle,
                    textDirection: TextDirection.rtl, size: 12.0)),
          ]),
          new IndicationBar(
              value: player.conhecimento,
              valueColor: getBarColor(player.conhecimento)),
          new Text(player.conhecimento.toString() + "/100\n",
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize: 10.0,
                  )),
        ]),
        new Padding(padding: EdgeInsets.only(left: 10.0, top: 40.0) ,
        child:
        new Row(
          children: [
            new Text(player.nome,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline
                    .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold)),
            new Row(children: [
              Icon(FontAwesomeIcons.dollarSign,
                  textDirection: TextDirection.rtl, size: 15.0),
              new Text(player.patrimonio.toString(),
                  style: Theme.of(context).textTheme.headline.copyWith(
                        fontSize: 15.0,
                      )),
              new CustomTooltip(
                  message: "Quantidade de dinheiro que você possui",
                  child: Icon(FontAwesomeIcons.questionCircle, size: 12.0)),
            ]),
          ],
        ),),
        new GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 3.2,
            children: <Widget>[
              new Container(
                  color: Colors.blue,
                  child: new Text("   Data",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              new Container(
                  color: Colors.blue,
                  child: new Text("Despesas",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              new Container(
                  color: Colors.blue,
                  child: new Text("   Valor",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              new Container(
                  color: Colors.white,
                  child: new Text("29/07/2018",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black))),
              new Container(
                  color: Colors.white,
                  child: new Text("Banana",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black))),
              new Container(
                  color: Colors.white,
                  child: new Text("5,00 \$",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black))),
              new Container(
                  color: Colors.grey,
                  child: new Text("28/07/2018",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black))),
              new Container(
                  color: Colors.grey,
                  child: new Text("Videogame",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black))),
              new Container(
                  color: Colors.grey,
                  child: new Text("550,00 \$",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black))),
              new Container(
                  color: Colors.white,
                  child: new Text("27/07/2018",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black))),
              new Container(
                  color: Colors.white,
                  child: new Text("Livro",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black))),
              new Container(
                  color: Colors.white,
                  child: new Text("50,00 \$",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          color: Colors.black)))
            ]),
      ]),
    );
  }
}
