import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pedido.dart';

class PedidosService {
  static const String baseUrl = "http://localhost:3000/pedidos";
  static const String apiKey = "123456";
  
  Future<List<Pedido>> getPedidos() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: { "x-api-key": apiKey },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((e) => Pedido.fromJson(e)).toList();
    }

    throw Exception("Error al obtener pedidos");
  }

  Future<Pedido> getPedidoCompleto(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/completo/$id"),
      headers: { "x-api-key": apiKey },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Pedido.fromJson(data);
    }

    throw Exception("Error al obtener detalle del pedido");
  }
}
