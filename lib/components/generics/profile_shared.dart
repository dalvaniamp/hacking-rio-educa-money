import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:miverva_app/generic_model/player.dart';

class ProfileShared{
  Player player;

  Future<Player> getPlayer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return new Player(
        prefs.get("nome"),
        prefs.get("fome"),
        prefs.get("saude"),
        prefs.get("lazer"),
        prefs.get("conhecimento"),
        prefs.get("patrimonio"),
        prefs.get("rendaDiaria"),
        prefs.get("nivel"),
        prefs.get("imagemDePerfil")
    );
  }

  savePlayer(Player player) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(player.nome);
    await prefs.setString("nome", player.nome);
    await prefs.setInt("saude", player.saude);
    await prefs.setInt("nivel", player.nivel);
    await prefs.setInt("fome", player.fome);
    await prefs.setInt("conhecimento", player.conhecimento);
    await prefs.setInt("lazer", player.lazer);
    await prefs.setDouble("patrimonio", player.patrimonio);
    await prefs.setDouble("rendaDiaria", player.rendaDiaria);
    await prefs.setString("imagemDePerfil", player.imagemDePerfil);
  }
}