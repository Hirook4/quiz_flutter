import 'package:flutter/material.dart';
import 'package:quiz_flutter/pergunta.dart';
import 'package:quiz_flutter/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get temPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        temPergunta ? perguntas[perguntaSelecionada]['respostas'] : null;

    return Column(
      children: <Widget>[
        Pergunta(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => responder(resp['ponto']),
          );
        }).toList(),
      ],
    );
  }
}
