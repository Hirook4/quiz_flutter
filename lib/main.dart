import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  var _totalPonto = 0;
  final _perguntas = const [
    {
      'texto': 'Qual o nome verdadeiro de Ben Kenobi?',
      'respostas': [
        {'texto': 'Obi-Wan Kenobi', 'ponto': 1},
        {'texto': 'Benvett Kenobi', 'ponto': 0},
        {'texto': 'Wanbi Kenobi', 'ponto': 0},
        {'texto': 'Mace Kenobi', 'ponto': 0},
      ]
    },
    {
      'texto': 'Quem é o "pai" de Boba Fett?',
      'respostas': [
        {'texto': 'Darth Tyranus', 'ponto': 0},
        {'texto': 'Wobbuffet', 'ponto': 0},
        {'texto': 'Salazar Fett', 'ponto': 0},
        {'texto': 'Jango Fett', 'ponto': 1},
      ]
    },
    {
      'texto': 'Shmi Skywalker é o que de Anakin?',
      'respostas': [
        {'texto': 'Filha', 'ponto': 0},
        {'texto': 'Irmã', 'ponto': 0},
        {'texto': 'Mãe', 'ponto': 1},
        {'texto': 'Esposa', 'ponto': 0},
        ]
    },
    {
      'texto': 'Quem era mestre de Darth Sidious?',
      'respostas': [
        {'texto': 'Darth Plagueis', 'ponto': 1},
        {'texto': 'Darth Maul', 'ponto': 0},
        {'texto': 'Darth Vader', 'ponto': 0},
        {'texto': 'Darth Revan', 'ponto': 0},
      ]
    }
  ];

  void _responder(int ponto) {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _totalPonto = _totalPonto + ponto;
      });
    }
  }

  void _reiniciarPerguntas() {
    setState(() {
      _perguntaSelecionada = 0;
      _totalPonto = 0;
    });
  }

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz Star Wars Hirooka')),
      ),
      body: temPergunta
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder,
            )
          : Resultado(_totalPonto, _reiniciarPerguntas),
    ));
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
