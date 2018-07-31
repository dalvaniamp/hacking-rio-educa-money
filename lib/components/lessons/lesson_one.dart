import 'package:flutter/material.dart';
import 'package:miverva_app/components/lessons/card.dart';
import 'package:miverva_app/components/lessons/page_selector.dart';

class LessonOne extends StatelessWidget {
  static const cardList = <CustomCard>[
    CustomCard(
        title: "Bem-vindo à primeira lição!",
        text:
            "Dinheiro nada mais é do que um instrumento utilizado nas trocas comerciais da sociedade.",
        iconBaseLocation: "assets/icons/growth.png"),
    CustomCard(
        text:
            "Nesse jogo, o dinheiro é chamado de Minerva. Você recebe uma quantia de Minervas por dia, dependendo do seu nível de conhecimento.",
        iconBaseLocation: "assets/icons/growth.png"),
    CustomCard(
      text:
          "Por exemplo, agora o seu personagem está faminto. Ninguém consegue aprender com fome, não é? Agora é hora de alimentar o seu personagem.",
      iconBaseLocation: "assets/icons/growth.png",
    ),
    CustomCard(
        title: "Você está pronto?",
        iconBaseLocation: "assets/icons/growth.png",
        questions: "Claro!",
        routeUrl: "loja"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Introdução 1"),
      ),
      body: Center(child: new CardSelector(listCard: cardList)),
    );
  }
}
