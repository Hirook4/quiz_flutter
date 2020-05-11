import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int ponto;
  final void Function() quandoReiniciar;

  Resultado(this.ponto, this.quandoReiniciar);

  String get fraseFinal {
    if (ponto <= 1) {
      return 'Você tem muito o que aprender jovem Padawan!';
    } else if (ponto <= 2) {
      return 'Seus conhecimento ainda podem melhorar...';
    } else if (ponto <= 3) {
      return 'Muito bom, mas ainda pode melhorar...';
    } else {
      return 'Conhecimento Nivel Jedi !';
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
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 22),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciar,
          padding: EdgeInsets.all(80),
        )
      ],
    );
  }
}
