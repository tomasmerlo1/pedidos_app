import 'package:flutter/material.dart';
import '../models/producto.dart';
import '../services/productos_service.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  final ProductosService _service = ProductosService();
  late Future<List<Producto>> _futureProductos;

  @override
  void initState() {
    super.initState();
    _futureProductos = _service.getProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Productos")),
      body: FutureBuilder(
        future: _futureProductos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final productos = snapshot.data!;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (_, index) {
              final p = productos[index];
              return ListTile(
                title: Text(p.nombre),
                trailing: Text("\$${p.precio}"),
              );
            },
          );
        },
      ),
    );
  }
}
