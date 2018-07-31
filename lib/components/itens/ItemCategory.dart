import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';

class ItemCategory extends StatelessWidget {

  final String chosenPage;

  ItemCategory(this.chosenPage);

  @override
  Widget build(BuildContext context) {


    return new Container(



        margin: const EdgeInsets.only(
          top: 50.0,
          bottom: 16.0,
          left: 24.0,
          right: 24.0,
        ),


        decoration: new BoxDecoration(
          color: new Color(0xFF333366),





          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 0.0,
              offset: new Offset(0.0, 5.0),
            ),

          ],
        ),

        child: new Row(

            children: <Widget>[

              new Container(

                height: 90.0,
              width: 270.0,



              child:new RaisedButton(


                  color: new Color(0xFF333366),
                  textColor: Colors.white,

                  child: new Text(chosenPage,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                  ),



              ),
                  onPressed: () { Navigator.pushNamed(context, '/' + removeDiacritics(chosenPage.toLowerCase()));}

        )


              )]),


        padding: new EdgeInsets.only(top: 1.0),
    height: 100.0
    );

  }
}
