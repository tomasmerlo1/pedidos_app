import 'detalle.dart';

class Pedido {
  final int id;
  final String fecha;
  final double total;
  final int idCliente;
  final String? clienteNombre;
  final List<Detalle> detalles;

  Pedido({
    required this.id,
    required this.fecha,
    required this.total,
    required this.idCliente,
    this.clienteNombre,
    this.detalles = const [],
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'],
      fecha: json['fecha'],
      total: json['total'] * 1.0,
      idCliente: json['id_cliente'],
      clienteNombre: json['cliente_nombre'],
      detalles: json['detalles'] != null
          ? (json['detalles'] as List)
              .map((e) => Detalle.fromJson(e))
              .toList()
          : [],
    );
  }
}
