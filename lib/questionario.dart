import 'package:flutter/material.dart';
import 'package:quiz_flutter/pergunta.dart';
import 'package:quiz_flutter/resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  Questionario({ //Required, só vão ser usados esses componentes se esses parametros existirem
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get temPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<String> respostas =
        temPergunta ? perguntas[perguntaSelecionada]['respostas'] : null;

    return Column(
      children: <Widget>[
        Pergunta(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((t) => Resposta(t, responder)).toList(),
      ],
    );
  }
}
