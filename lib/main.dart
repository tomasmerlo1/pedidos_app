import 'package:flutter/material.dart';
import 'screens/clientes_screen.dart';
import 'screens/productos_screen.dart';
import 'screens/pedidos_screen.dart';
import 'screens/crear_pedido_screen.dart';

void main() {
  runApp(PedidosApp());
}

class PedidosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Pedidos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sistema de Pedidos")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Clientes"),
            subtitle: Text("Ver lista de clientes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ClientesScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Productos"),
            subtitle: Text("Ver lista de productos"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProductosScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Pedidos"),
            subtitle: Text("Ver pedidos existentes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PedidosScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Crear Pedido"),
            subtitle: Text("Generar un nuevo pedido"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CrearPedidoScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
