class Detalle {
  final int idProducto;
  final String? productoNombre;
  final int cantidad;
  final double precioUnitario;

  Detalle({
    required this.idProducto,
    this.productoNombre,
    required this.cantidad,
    required this.precioUnitario,
  });

  factory Detalle.fromJson(Map<String, dynamic> json) {
    return Detalle(
      idProducto: json['id_producto'],
      productoNombre: json['producto_nombre'],
      cantidad: json['cantidad'],
      precioUnitario: json['precio_unitario'] * 1.0,
    );
  }
}
