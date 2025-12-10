import 'package:flutter/material.dart';
import '../services/clientes_service.dart';
import '../services/productos_service.dart';
import '../services/pedidos_service.dart';
import '../models/cliente.dart';
import '../models/producto.dart';

class CrearPedidoScreen extends StatefulWidget {
  @override
  _CrearPedidoScreenState createState() => _CrearPedidoScreenState();
}

class _CrearPedidoScreenState extends State<CrearPedidoScreen> {
  final ClientesService clientesService = ClientesService();
  final ProductosService productosService = ProductosService();
  final PedidosService pedidosService = PedidosService();

  List<Cliente> clientes = [];
  List<Producto> productos = [];

  Cliente? clienteSeleccionado;
  Producto? productoSeleccionado;
  int cantidad = 1;

  bool cargando = true;

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    final listaClientes = await clientesService.getClientes();
    final listaProductos = await productosService.getProductos();

    setState(() {
      clientes = listaClientes;
      productos = listaProductos;
      cargando = false;
    });
  }

  Future<void> crearPedido() async {
    if (clienteSeleccionado == null || productoSeleccionado == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Selecciona cliente y producto")));
      return;
    }

    bool ok = await pedidosService.crearPedido(
      idCliente: clienteSeleccionado!.id,
      idProducto: productoSeleccionado!.id,
      cantidad: cantidad,
    );

    if (ok) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Pedido creado con éxito")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error al crear pedido")));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cargando) {
      return Scaffold(
        appBar: AppBar(title: Text("Crear Pedido")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Crear Pedido")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<Cliente>(
              decoration: InputDecoration(labelText: "Cliente"),
              items: clientes.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.nombre));
              }).toList(),
              onChanged: (v) => setState(() => clienteSeleccionado = v),
            ),
            SizedBox(height: 20),

            DropdownButtonFormField<Producto>(
              decoration: InputDecoration(labelText: "Producto"),
              items: productos.map((p) {
                return DropdownMenuItem(
                  value: p,
                  child: Text("${p.nombre} - \$${p.precio}"),
                );
              }).toList(),
              onChanged: (v) => setState(() => productoSeleccionado = v),
            ),
            SizedBox(height: 20),

            TextFormField(
              decoration: InputDecoration(labelText: "Cantidad"),
              initialValue: "1",
              keyboardType: TextInputType.number,
              onChanged: (v) => cantidad = int.tryParse(v) ?? 1,
            ),
            SizedBox(height: 25),

            ElevatedButton(onPressed: crearPedido, child: Text("Crear Pedido")),
          ],
        ),
      ),
    );
  }
}
