import 'package:flutter/material.dart';
import 'package:miverva_app/components/lessons/card.dart';
import 'package:miverva_app/components/lessons/page_selector.dart';

class LessonTwo extends StatelessWidget {
  static const _cardList = <CustomCard>[
    CustomCard(
        title: "Segunda lição",
        text: "Hoje vamos falar sobre..",
        iconBaseLocation: "assets/icons/growth.png"),
    CustomCard(
        title: "Dá uma olhada!",
        iconBaseLocation: "assets/icons/growth.png",
        iconImageLocation:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"),
    CustomCard(
        title: "Nos vemos na próxima aula!",
        questions: "Até mais!",
        iconBaseLocation: "assets/icons/growth.png",
      achievementImageLocation: "assets/icons/growth.png"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Introdução 2"),
      ),
      body: Center(
          //child: VideoDemo(title: "Video tutorial", description: "Video descritivo", uri: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")

          child: new CardSelector(listCard: _cardList)),
    );
  }
}
