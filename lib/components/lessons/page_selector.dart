// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:miverva_app/components/generics/achievement_dialog_component.dart';
import 'package:miverva_app/components/lessons/card.dart';
import 'package:miverva_app/components/lessons/card_tile.dart';

class _PageSelector extends StatelessWidget {
  const _PageSelector({this.listCards});

  final List<CustomCard> listCards;

  void _handleArrowButtonPress(BuildContext context, int delta) {

    final TabController controller = DefaultTabController.of(context);
    if (!controller.indexIsChanging)
      controller
          .animateTo((controller.index + delta).clamp(0, listCards.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    final Color color = Theme.of(context).accentColor;
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Column(
        children: <Widget>[
          new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Row(children: <Widget>[
                new IconButton(
                    icon: const Icon(Icons.chevron_left),
                    color: color,
                    onPressed: () {
                      _handleArrowButtonPress(context, -1);
                    },
                    tooltip: 'Page back'),

                new TabPageSelector(controller: controller),
                new IconButton(
                    icon: const Icon(Icons.chevron_right),
                    color: color,
                    onPressed: () {
                      _handleArrowButtonPress(context, 1);
                    },
                    tooltip: 'Page forward')
              ], mainAxisAlignment: MainAxisAlignment.spaceBetween)),
          new Expanded(
            child: new IconTheme(
              data: new IconThemeData(
                size: 128.0,
                color: color,
              ),
              child: new TabBarView(
                  children: listCards.map((CustomCard card) {
                return new Container(
                  child: getCardOrPopup(card),
                );
              }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getCardOrPopup(CustomCard card){
  if(card.achievementImageLocation != null){
    return new Container(height: 900.0, width: 400.0, child:
      new AchievementDialog("Parabéns!", "assets/icons/medalha.png", "Voce conseguiu!", 32.0, 22.0, 280.0)
    );
  }

  return new CardTile(card: card);

}

class CardSelector extends StatelessWidget {
  final List<CustomCard> listCard;

  const CardSelector({
    Key key,
    @required this.listCard,
  }) : assert(listCard != null);

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: listCard.length, child: new _PageSelector(listCards: listCard));
  }
}
