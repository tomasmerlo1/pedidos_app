import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../services/clientes_service.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final ClientesService _service = ClientesService();
  late Future<List<Cliente>> _futureClientes;

  @override
  void initState() {
    super.initState();
    _futureClientes = _service.getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clientes")),
      body: FutureBuilder(
        future: _futureClientes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final clientes = snapshot.data!;

          return ListView.builder(
            itemCount: clientes.length,
            itemBuilder: (_, index) {
              final c = clientes[index];
              return ListTile(
                title: Text(c.nombre),
                subtitle: Text(c.direccion),
                trailing: Text(c.telefono),
              );
            },
          );
        },
      ),
    );
  }
}
