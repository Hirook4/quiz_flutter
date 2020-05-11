import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Resultado extends StatelessWidget {
  final int ponto;
  final void Function() quandoReiniciar;

  _launchURL() async {
    const url = 'https://github.com/Hirook4';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Resultado(this.ponto, this.quandoReiniciar);

  String get fraseFinal {
    if (ponto <= 0) {
      return 'Você não possui afinidade com a Força... \n 0 Acertos';
    } else if (ponto <= 1) {
      return 'Você tem muito o que aprender jovem Padawan! 1 Acerto';
    } else if (ponto <= 2) {
      return 'Seus conhecimento ainda podem melhorar... \n 2 Acertos';
    } else if (ponto <= 3) {
      return 'Muito bom, mas ainda pode melhorar... \n 3 Acertos';
    } else {
      return 'Conhecimento Nivel Jedi ! 4 Acertos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseFinal,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 2),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text(
              'Reiniciar',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: quandoReiniciar,
          ),
        ),
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.black,
            child: Text(
              'Meu GitHub ;)',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: _launchURL,
          ),
        ),
      ],
    );
  }
}
