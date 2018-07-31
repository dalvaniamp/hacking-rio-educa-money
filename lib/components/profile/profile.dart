import 'package:flutter/material.dart';
import 'package:miverva_app/components/profile/custom_progress_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:miverva_app/generic_model/player.dart';
import 'custom_tooltip.dart';

import 'package:miverva_app/components/generics/profile_shared.dart';

@immutable
class ProfilePage extends StatefulWidget {
  Player player;
   @override
  State<StatefulWidget> createState() => new _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {

  Player player;

  @override
  void initState() {
    super.initState();
    setState((){
      getPlayer();
    });
  }

  getPlayer() async{
    setState(() {
      ProfileShared().getPlayer().then((player) => this.player = player);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: ProfileWidget().build(context, player)
    );
  }
}

class ProfileWidget{
  build(BuildContext context, Player player){
    return GridView.count(
      crossAxisCount: 2,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(player.imagemDePerfil),
            ),
          ),
        ),
        ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    new Icon(
                        FontAwesomeIcons.utensils,
                        size: 15.0
                    ),
                    new Text("Alimentação",
                        style: Theme.of(context).textTheme.headline.copyWith(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        )),
                    new CustomTooltip(
                        message: "Alimentação",
                        child: Icon(
                            FontAwesomeIcons.questionCircle,
                            textDirection: TextDirection.rtl,
                            size: 13.0
                        )
                    ),
                  ]
              ),
              new IndicationBar(value: player.fome, valueColor: getBarColor(player.fome)),
              new Text(player.fome.toString() + "/100\n",
                  style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize:10.0,
                  )
              ),

              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    new Icon(
                        FontAwesomeIcons.solidPlusSquare,
                        size: 15.0
                    ),
                    new Text("Saúde",
                        style: Theme.of(context).textTheme.headline.copyWith(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        )),
                    new CustomTooltip(
                        message: "Saúde",
                        child: Icon(
                            FontAwesomeIcons.questionCircle,
                            textDirection: TextDirection.rtl,
                            size: 13.0
                        )
                    ),
                  ]
              ),
              new IndicationBar(value: player.saude, valueColor: getBarColor(player.saude)),
              new Text(player.saude.toString() + "/100\n",
                  style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize:10.0,
                  )
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    new Icon(
                        FontAwesomeIcons.grinSquint,
                        size: 15.0
                    ),
                    new Text("Lazer",
                        style: Theme.of(context).textTheme.headline.copyWith(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        )),
                    new CustomTooltip(
                        message: "Lazer",
                        child: Icon(
                            FontAwesomeIcons.questionCircle,
                            textDirection: TextDirection.rtl,
                            size: 13.0
                        )
                    ),
                  ]
              ),
              new IndicationBar(value: player.lazer, valueColor: getBarColor(player.lazer)),
              new Text(player.lazer.toString() + "/100\n",
                  style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize:10.0,
                  )
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    new Icon(
                        FontAwesomeIcons.bookOpen,
                        size: 15.0
                    ),
                    new Text("Conhecimento",
                        style: Theme.of(context).textTheme.headline.copyWith(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        )),
                    new CustomTooltip(
                        message: "Conhecimento utilizado para passar de nível",
                        child: Icon(
                            FontAwesomeIcons.questionCircle,
                            textDirection: TextDirection.rtl,
                            size: 13.0
                        )
                    ),
                  ]
              ),
              new IndicationBar(value: player.conhecimento, valueColor: getBarColor(player.conhecimento)),
              new Text(player.conhecimento.toString() + "/100\n",
                  style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize:10.0,
                  )
              ),
            ]
        ),
        new ListView(
          padding: EdgeInsets.all(40.0),
          children: [
            new Text(player.nome,
                style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                )
            ),
            new Row(
                children: [
                  Icon(
                      FontAwesomeIcons.dollarSign,
                      textDirection: TextDirection.rtl,
                      size: 15.0
                  ),
                  new Text(' M\$ ' + player.patrimonio.toString(),
                      style: Theme.of(context).textTheme.headline.copyWith(
                        fontSize: 15.0,
                      )),
                  new CustomTooltip(
                      message: "Quantidade de dinheiro que você possui",
                      child: Icon(
                          FontAwesomeIcons.questionCircle,
                          size: 13.0
                      )
                  ),
                ]
            ),
            new Row(
                children: [
                  Icon(
                      FontAwesomeIcons.handHoldingUsd,
                      textDirection: TextDirection.rtl,
                      size: 15.0
                  ),
                  new Text(' M\$ ' + player.rendaDiaria.toString() + " ",
                      style: Theme.of(context).textTheme.headline.copyWith(
                        fontSize: 15.0,
                      )),
                  new CustomTooltip(
                      message: "Quantidade de dinheiro que ganha diariamente",
                      child: Icon(
                          FontAwesomeIcons.questionCircle,
                          size: 13.0
                      )
                  ),
                ]
            ),
          ],
        ),
        new Padding(
          padding: EdgeInsets.all(40.0),
          child:
          new Column(
            children:[
              new Text("Nível",
                  style: Theme.of(context).textTheme.headline.copyWith(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  )
              ),
              new Container(
                  child: new CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: new Text(
                        player.nivel.toString(),
                        style: Theme.of(context).textTheme.headline.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                  width: 32.0,
                  height: 32.0,
                  padding: const EdgeInsets.all(3.0),
                  decoration: new BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  )
              )
            ],
          ),
        ),
      ],
    );
  }

  Animation<Color> getBarColor(int value){
    Color color = value/100 < 0.5 ? Colors.red : value/100 < 0.8 ? Colors.yellow : Colors.green;
    return new AlwaysStoppedAnimation(color);
  }
}

class IndicationBar extends LinearCustomProgressIndicator{

  const IndicationBar({
    Key key,
    int value,
    Animation<Color> valueColor,
  }) : super(key: key, value: value/100, backgroundColor: Colors.black12, valueColor: valueColor);
}