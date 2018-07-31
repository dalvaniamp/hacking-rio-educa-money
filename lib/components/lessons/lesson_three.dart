import 'package:flutter/material.dart';
import 'package:miverva_app/components/lessons/card.dart';
import 'package:miverva_app/components/lessons/page_selector.dart';
import 'package:miverva_app/components/generics/achievement_dialog_component.dart';

class LessonThree extends StatelessWidget {
  static const _cardList = <CustomCard>[
    CustomCard(
        title: "Aprendendo sobre..",
        text: "Você já pensou sobre...",
        iconBaseLocation: "assets/icons/growth.png"),
    CustomCard(
        title: "Dá uma olhada!",
        iconBaseLocation: "assets/icons/currency.png",
        iconImageLocation: "assets/gif/desperdicio.gif"),
    CustomCard(
        title: "Nessa situação, o que você faria?",
        questions: "Claro que queimaria também!*Nunca faria isso!",
        iconBaseLocation: "assets/icons/growth.png",
    ),
    CustomCard(
      iconBaseLocation: "assets/icons/growth.png",
      achievementImageLocation: "assets/icons/growth.png",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Introdução 3"),
      ),
      body: Center(child: new CardSelector(listCard: _cardList),),

    );
  }
}
