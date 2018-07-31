import 'package:flutter/material.dart';
import 'package:miverva_app/components/generics/profile_shared.dart';
import 'package:miverva_app/generic_model/player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemRow extends StatefulWidget {
  final String name;
   ProfileShared profile;
   Player player;

  ItemRow(this.name);

  @override
  State<StatefulWidget> createState() => new _ItemRowState(name);

}

class _ItemRowState extends State<ItemRow>{

  Player player;
  final String name;

  _ItemRowState(this.name);

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
    return new Container(

      child:new RaisedButton(


        child: new Stack(

          children: <Widget>[
            itemCard,
            new Container(
              alignment: FractionalOffset.topRight,
              margin: new EdgeInsets.only(
                top: 20.0,
                right: 60.0,
              ),
              child: new Container(
                  child: new Text(
                name,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 28.0,
                ),
              )),
            ),
            itemImg(name),
            price(name),
            benefit(name),
            description(name),
          ],
        ),

          onPressed: () {

             if (name=="Remédio" || name == "Curativo" || name == "Escova")
               {
                 player.saude=20;
                 if (name=="Remédio")
                 player.patrimonio=-50.0;
                     else{
                   player.patrimonio=-20.0;
                 }
               }
               else if(name=="Banana" || name == "Morango" || name == "Pizza" || name == "Abacate")
                 {
                   if(name== "Morango") {
                     player.fome = 30;
                     player.patrimonio = -10.0;
                   }
                   else()
                   {
                     player.fome=10;
                         player.patrimonio=-5.0;
                   };
                 }
             else if( name== "Dicionário")
             {
               player.conhecimento=30;
               player.patrimonio=-50.0;
             }
             else if( name== "Livro")
             {
               player.conhecimento=20;
               player.patrimonio=-40.0;
             }
             else if( name== "Videogame")
             {
               player.lazer=20;
               player.patrimonio=-550.0;
             }
             else if( name== "Bola")
             {

               player.patrimonio=-50.0;
               player.lazer=30;
             }
             else
               {
                 player.patrimonio=0.0;
               }

             ProfileShared().savePlayer(player);

          }
      ),
      margin: const EdgeInsets.only(
      top: 16.0,
      bottom: 16.0,
      left: 24.0,
      right: 24.0,
    ),
    padding: new EdgeInsets.only(top: 1.5),
    height: 250.0,
      )
    ;
  }

  final itemCard = new Container(
    margin: new EdgeInsets.only(right: 1.0),
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );
}

Container itemImg(String name) {
  return new Container(
    margin: new EdgeInsets.symmetric(
      vertical: 9.0,
      horizontal: 9.0,
    ),
    alignment: FractionalOffset.centerLeft,
    child: new Image(
      image: new AssetImage("assets/icons/" + name.toLowerCase() + ".png"),
      alignment: FractionalOffset.centerLeft,
    ),
  );
}

Container price(String name) {
  return new Container(
      alignment: FractionalOffset.bottomRight,
      margin: new EdgeInsets.only(
        bottom: 20.0,
        right: 40.0,
        left: 40.0,
      ),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image(
                    width: 20.0,
                    height: 20.0,
                    image: new AssetImage("assets/icons/price.png"),
                  ),
                  new Text(
                    acheOpreco(name),
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                    ),
                  ),
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image(
                    width: 20.0,
                    height: 20.0,
                    image: new AssetImage("assets/icons/seta.png"),
                  ),
                  new Text(
                    acheObeneficio(name),
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                    ),
                  ),
                  rewardImage(name),
                ]),
          ]));
}

  Icon rewardImage(String name) {
    if (name == "Banana") {
      return new Icon(FontAwesomeIcons.utensils, size: 20.0);
    } else if (name == "Abacate") {
      return new Icon(FontAwesomeIcons.utensils, size: 20.0);
    } else if (name == "Morango") {
      return new Icon(FontAwesomeIcons.utensils, size: 20.0);
    } else if (name == "Livro") {
      return new Icon(FontAwesomeIcons.bookOpen, size: 20.0);
    } else if (name == "Dicionário") {
      return new Icon(FontAwesomeIcons.bookOpen, size: 20.0);
    } else if (name == "Videogame") {
      return new Icon(FontAwesomeIcons.grin, size: 20.0);
    } else if (name == "Bola") {
      return new Icon(FontAwesomeIcons.grin, size: 20.0);
    } else if (name == "Desafios") {
      return new Icon(FontAwesomeIcons.bookOpen, size: 20.0);
    } else {
      return new Icon(FontAwesomeIcons.questionCircle, size: 20.0);;
    }
  }

Container benefit(String name) {
  return new Container(
      alignment: FractionalOffset.centerRight,
      margin: new EdgeInsets.only(right: 38.0, top: 10.0));
}

Container description(String name) {
  return new Container(
      alignment: FractionalOffset.centerRight,
      margin: new EdgeInsets.only(right: 38.0, top: 10.0),
      child: new Text(acheAdescricao(name),
          textAlign: TextAlign.left,
          style: new TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.0,
          )));
}

String acheOpreco(String name) {
  if (name == "Banana" || name == "Abacate" ||name == "Pizza") {
    return "5.00 M\$";
  } else if (name == "Morango" ) {
    return "10.00 M\$";
  } else if (name == "Livro" || name =="Escova" || name == "Curativo") {
    return "40.00 M\$";
  } else if (name == "Dicionário" || name == "Bola" || name == "Remédio") {
    return "50.00 M\$";
  } else if (name == "Videogame") {
    return "550.00 M\$";
  }else{
    return "100.00 M\$";
  }
}

String acheAdescricao(String name) {
  if (name == "Banana") {
    return "Potássio recarrega \n as suas energias \n";


  } else if (name == "Abacate") {
    return "Delicioso e \n refrescante";
  } else if (name == "Livro") {
    return "Porta do \n conhecimento";
  } else if (name == "Dicionário") {
return "Muito \n importante";
} else if (name == "Videogame") {
return "Vem se \n divertir";
}
 else if (name == "Bola de futebol") {
return "Vamos jogar!";
  }
  else if (name == "Curativo") {
    return "Band-Aid";
  }
  else if (name == "Pizza") {
    return "Delícia \n italiana";
  }
  else if (name == "Escova") {
    return "Penteie os \n cabelos";

  } else {
    return "A melhor \n escolha";
  }
}

String acheObeneficio(String name) {

  if (name == "Abacate" || name=="Pizza" || name=="Banana") {
    return "+10 ";
    } else if (name == "Dicionário" || name == "Bola" || name== "Morango") {
    return "+30 ";
  }
  else if (name == "Curativo" || name=="Escova"|| name=="Remédio" || name=="Videogame" || name == "Livro" ) {
    return "+20 ";

  } else {
    return "+20 ";
  }
}
