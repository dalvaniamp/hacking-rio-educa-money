
import 'package:flutter/material.dart';


class ItemBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;



  ItemBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
        decoration: new BoxDecoration(color: Colors.blue),
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + barHeight,
        child: new Center(
            child: new Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 36.0
                )
            )
        )
    );

  }
}