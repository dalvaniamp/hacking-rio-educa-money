import 'package:flutter/material.dart';


class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Itens Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}