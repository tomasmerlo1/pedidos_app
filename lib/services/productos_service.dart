import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/producto.dart';

class ProductosService {
  static const String baseUrl = "http://localhost:3000/productos";
  static const String apiKey = "123456"; // tu API KEY

  Future<List<Producto>> getProductos() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: { "x-api-key": apiKey },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((e) => Producto.fromJson(e)).toList();
    }

    throw Exception("Error al obtener productos");
  }
}
