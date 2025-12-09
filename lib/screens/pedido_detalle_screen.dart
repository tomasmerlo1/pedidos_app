import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../services/pedidos_service.dart';

class PedidoDetalleScreen extends StatefulWidget {
  final int pedidoId;

  const PedidoDetalleScreen({super.key, required this.pedidoId});

  @override
  State<PedidoDetalleScreen> createState() => _PedidoDetalleScreenState();
}

class _PedidoDetalleScreenState extends State<PedidoDetalleScreen> {
  final PedidosService _service = PedidosService();
  late Future<Pedido> _futurePedido;

  @override
  void initState() {
    super.initState();
    _futurePedido = _service.getPedidoCompleto(widget.pedidoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pedido #${widget.pedidoId}")),
      body: FutureBuilder(
        future: _futurePedido,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final pedido = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cliente: ${pedido.clienteNombre}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Fecha: ${pedido.fecha}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                const Text(
                  "Detalles del Pedido:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: pedido.detalles.length,
                    itemBuilder: (_, index) {
                      final d = pedido.detalles[index];
                      return ListTile(
                        title: Text(d.productoNombre ?? ''),
                        subtitle: Text("Cantidad: ${d.cantidad}"),
                        trailing: Text("\$${d.precioUnitario * d.cantidad}"),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  "TOTAL: \$${pedido.total}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
