import 'dart:convert';
import 'package:http/http.dart' as http;

// Função para criar uma nova sala
Future<void> criarSala(String nomeSala) async {
  var url = Uri.parse('https://replit.com/@pfalcheti1/apijogoaula15/salas');
  var resposta = await http.post(url, body: {'nome': nomeSala});
  if (resposta.statusCode == 200) {
    // Sucesso ao criar a sala, tratar a resposta se necessário
    print('Sala criada com sucesso!');
    print(jsonDecode(resposta.body));
  } else {
    // Tratar erro ao criar a sala
    print('Erro ao criar sala: ${resposta.statusCode}');
  }
}

// Função para buscar todas as salas disponíveis
Future<List<dynamic>> buscarSalas() async {
  var url = Uri.parse('https://replit.com/@pfalcheti1/apijogoaula15/salas');
  var resposta = await http.get(url);
  if (resposta.statusCode == 200) {
    // Retornar lista de salas
    return jsonDecode(resposta.body);
  } else {
    // Tratar erro ao buscar salas
    throw Exception('Erro ao buscar salas');
  }
}
