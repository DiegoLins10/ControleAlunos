import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(
    MaterialApp(
      title: "Fatec Ferraz- Controle de Alunos",
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode Entrar!";
  String _color = "Colors.white";

  _alteraContador(int i) {
    setState(() {
      _pessoa += i;

      if (_pessoa <= 0) {
        _mensagem = "Não chegou ninguem ainda !";
        _pessoa = 0;
        _color = "Colors.white";
      } else if (_pessoa > 50) {
        _mensagem = "Lotado ! Por Favor, Aguarde !";
        _pessoa = 50;
        _color = "Colors.red";
      } else {
        _mensagem = "Pode Entrar!";
        _color = "Colors.green";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          title: const Text('Fatec ferraz'),
        ),
        Container(
          color: Colors.black,
        ),
        Image.asset(
          'images/fatec_ferraz_2.jpg',
          fit: BoxFit.contain,
          height: 900,
          alignment: Alignment.topCenter,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_pessoa",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _alteraContador(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _alteraContador(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _mensagem,
              style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 20),
                      const Offset(150, 20),
                      <Color>[
                        Colors.red,
                        Colors.yellow,
                      ],
                    )),
            ), //
          ],
        ),
      ],
    );
  }
}
