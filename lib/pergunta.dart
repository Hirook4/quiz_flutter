import 'package:flutter/material.dart';

class Pergunta extends StatelessWidget {

  final String texto;
  Pergunta(this.texto); //Construtor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
