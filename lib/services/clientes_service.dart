import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';

class ClientesService {
  static const String baseUrl = "http://localhost:3000/clientes";
  static const String apiKey = "123456";

  Future<List<Cliente>> getClientes() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {"x-api-key": apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((e) => Cliente.fromJson(e)).toList();
    }

    throw Exception("Error al obtener clientes");
  }
}
