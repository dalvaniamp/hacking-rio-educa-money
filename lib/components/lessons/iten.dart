
import 'package:flutter/material.dart';
import 'package:miverva_app/components/lessons/card.dart';
import 'package:miverva_app/components/lessons/page_selector.dart';


class CardScreen extends StatelessWidget {


  static const _cardList = <CustomCard>[
    CustomCard(title: "Bem-vindo à primeira lição!", text: "Dinheiro nada mais é do que um instrumento utilizado nas trocas comerciais da sociedade.", iconBaseLocation: "assets/icons/currency.png"),
    CustomCard(text: "Nesse jogo, o dinheiro é chamado de Minerva. Você recebe uma quantia de Minervas por dia, dependendo do seu nível de conhecimento.", iconBaseLocation: "assets/icons/currency.png"),
    CustomCard(text: "Você pode utilizar Minervas para comprar itens ou serviços para o seu personagem. Por exemplo, agora o seu personagem está faminto. Você pode utilizar as suas Minervas para comprar comida para ele.", iconBaseLocation: "assets/icons/currency.png"),
    CustomCard(text: "Ninguém consegue aprender com fome, não é? Agora é hora de alimentar o seu personagem.", iconBaseLocation: "assets/icons/currency.png"),
    CustomCard(title: "Você não quer ser assim, não é?", iconBaseLocation: "assets/icons/currency.png", iconImageLocation: "assets/gif/desperdicio.gif")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Screen"),
      ),
      body: Center(
          child: new CardSelector(listCard: _cardList)

      ),
    );
  }
}