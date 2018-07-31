import 'package:flutter/material.dart';
import 'package:miverva_app/components/generics/achievement_dialog_component.dart';
import 'package:miverva_app/components/learningtree/iten.dart';
import 'package:miverva_app/components/lessons/lesson_one.dart';
import 'package:miverva_app/components/lessons/lesson_three.dart';
import 'package:miverva_app/components/lessons/lesson_two.dart';
import 'package:miverva_app/components/profile/profile.dart';
import 'package:miverva_app/components/report/iten.dart';
import 'package:miverva_app/components/itens/ItemTemplate.dart';
import 'package:miverva_app/components/itens/Loja.dart';
import 'package:miverva_app/components/missions/missions.dart';
import 'package:miverva_app/generic_model/player.dart';
import 'package:miverva_app/components/generics/profile_shared.dart';


void main() {
  Player player = new Player('Joana Silva', 100, 70, 40, 10, 100.0, 10.0, 1, './assets/images/perfil.jpg');

  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/loja': (context) => Loja(),
      '/lazer': (context) => Lazer(),
      '/comida': (context) => Comida(),
      '/estudos': (context) => Estudos(),
      '/saude': (context) => Saude(),
      '/learningtree': (context) => LearningTreeScreen(),
      '/profile': (context) => ProfilePage(),
      '/cardone': (context) => LessonOne(),
      '/cardtwo': (context) => LessonTwo(),
      '/cardthree': (context) => LessonThree(),
      '/report': (context) => ReportScreen(player),
      '/missions': (context) => MissionScreen(),
    },
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Player player = new Player('Joana Silva', 100, 70, 40, 10, 100.0, 10.0, 1, './assets/images/perfil.jpg');
    ProfileShared().savePlayer(player);
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        fontFamily: 'Ubuntu',
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Pagina Inicial'),
      routes: {
        '/loja': (context) => Loja(),
        '/lazer': (context) => Lazer(),
        '/comida': (context) => Comida(),
        '/estudos': (context) => Estudos(),
        '/saude': (context) => Saude(),
        '/learningtree': (context) => LearningTreeScreen(),
        '/profile': (context) => ProfilePage(),
        '/cardone': (context) => LessonOne(),
        '/cardtwo': (context) => LessonTwo(),
        '/cardthree': (context) => LessonThree(),
        '/report': (context) => ReportScreen(player),
        '/missions': (context) => MissionScreen(),
        '/achievement': (context) => AchievementDialog("Você ganhou", "assets/icons/videogame.png", "Parabéns"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  Player player = new Player('Joana Silva', 100, 70, 40, 10, 100.0, 10.0, 1, './assets/images/perfil.jpg');

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
      return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
                title: new Text("Página inicial"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                }
            ),
            new Divider(),
            new ListTile(
                title: new Text("Carreira"),
                trailing: new Icon(Icons.work),
                onTap: () {
                  Navigator.pushNamed(context, '/learningtree');
                }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Loja"),
              trailing: new Icon(Icons.store),
              onTap: () {
                Navigator.pushNamed(context, '/loja');
              }
            ),
            new Divider(),
            new ListTile(
                title: new Text("Missões"),
                trailing: new Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, '/missions');
                }
            ),
            new Divider(),
            new ListTile(
                title: new Text("Perfil"),
                trailing: new Icon(Icons.people),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                }
            ),
            new Divider(),
            new ListTile(
                title: new Text("Sincronização (Em breve)"),
                trailing: new Icon(Icons.cancel),
                onTap: () {

                }
            ),
            new Divider(),
            new ListTile(
                title: new Text("Inventário (Em breve)"),
                trailing: new Icon(Icons.cancel),
                onTap: () {

                }
            ),
            new Divider(),
            new ListTile(
                title: new Text("Eventos (Em breve)"),
                trailing: new Icon(Icons.cancel),
                onTap: () {

                }
            ),
            new Divider(),
          ],
        ),
      ),
      body: new ReportScreen(player).build(context));
  }
}
