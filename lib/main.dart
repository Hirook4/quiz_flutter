import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';
import './resposta.dart';
import './pergunta.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual o nome verdadeiro de Ben Kenobi?',
      'respostas': [
        'Obi-Wan Kenobi',
        'Benvett Kenobi',
        'Wanbi Kenobi',
        'Mace Kenobi'
      ]
    },
    {
      'texto': 'Quem é o "pai" de Boba Fett?',
      'respostas': ['Darth Tyranus', 'Wobbuffet', 'Salazar Fett', 'Jango Fett']
    },
    {
      'texto': 'Shmi Skywalker é o que de Anakin?',
      'respostas': [
        'Filha de Anakin Skywalker',
        'Irmã de Anakin Skywalker',
        'Mãe de Anakin Skywalker',
        'Esposa de Anakin Skywalker'
      ]
    },
    {
      'texto': 'Quem era mestre de Darth Sidious?',
      'respostas': [
        'Darth Plagueis',
        'Darth Maul',
        'Darth Vader',
        'Darth Revan'
      ]
    }
  ];

  void _responder() {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Quiz Flutter Hirooka')),
      ),
      body: temPergunta
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder,
            )
          : Resultado(),
    ));
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
