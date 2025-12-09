import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../services/pedidos_service.dart';
import 'pedido_detalle_screen.dart';

class PedidosScreen extends StatefulWidget {
  const PedidosScreen({super.key});

  @override
  State<PedidosScreen> createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  final PedidosService _service = PedidosService();
  late Future<List<Pedido>> _futurePedidos;

  @override
  void initState() {
    super.initState();
    _futurePedidos = _service.getPedidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pedidos")),
      body: FutureBuilder<List<Pedido>>(
        future: _futurePedidos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final pedidos = snapshot.data ?? [];

          if (pedidos.isEmpty) {
            return const Center(child: Text("No hay pedidos cargados"));
          }

          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (_, index) {
              final p = pedidos[index];
              return ListTile(
                title: Text("Pedido #${p.id}"),
                subtitle: Text("Cliente: ${p.clienteNombre ?? '-'}"),
                trailing: Text("\$${p.total}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PedidoDetalleScreen(pedidoId: p.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
