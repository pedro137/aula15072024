import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: RepeteGame(),
  ));
}

class RepeteGame extends StatefulWidget {
  @override
  _RepeteGameState createState() => _RepeteGameState();
}

class _RepeteGameState extends State<RepeteGame> {
  int pontos = 0;
  int ultimoValor = 0;
  bool jogadorPerdeuVez = false;
  bool jogadorGanhou = false;

  int _rolarDado() {
    return Random().nextInt(6) + 1;
  }

  void jogarDado() {
    if (jogadorPerdeuVez || jogadorGanhou) return;

    int valor = _rolarDado();
    setState(() {
      if (valor == 5) {
        // Repete sem somar pontos
        ultimoValor = 0; // Zera o último valor para evitar soma subsequente
      } else if (valor == 1 || valor == 3) {
        // Perde a vez
        jogadorPerdeuVez = true;
      } else {
        // Soma pontos
        if (valor == ultimoValor) {
          pontos += valor;
          if (pontos >= 10) {
            jogadorGanhou = true;
          }
        } else {
          ultimoValor = valor;
          pontos = valor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo Repete'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pontos: $pontos',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: jogarDado,
              child: Text('Jogar Dado'),
            ),
            SizedBox(height: 20),
            if (jogadorPerdeuVez)
              Text(
                'Você perdeu a vez!',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            if (jogadorGanhou)
              Text(
                'Parabéns, você ganhou!',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
