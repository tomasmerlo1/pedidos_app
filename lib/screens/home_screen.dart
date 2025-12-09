import 'package:flutter/material.dart';
import 'clientes_screen.dart';
import 'productos_screen.dart';
import 'pedidos_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sistema de Pedidos")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Clientes"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ClientesScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Productos"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProductosScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Pedidos"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PedidosScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
