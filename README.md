# Pedidos App — Frontend en Flutter

Esta es la **aplicación frontend** desarrollada con **Flutter** para consumir la API de pedidos implementada en Node.js y desplegada en Render.

La app permite:
- Ver la lista de clientes
- Ver la lista de productos
- Ver y crear pedidos
- Consultar el detalle de cada pedido

Se comunica con la API REST que expone los datos para clientes, productos, pedidos y detalles.

---

## 🚀 Tecnologías

Esta app fue construida con:

- Flutter SDK
- Dart
- Librería `http` para consumir la API
- Compatible con ejecución en **Web (Chrome)**

---

## 🔗 Backend

La app está diseñada para consumir la API desplegada en:
https://api-pedidos-nnnv.onrender.com/

## 📦 Instalación y ejecución

1. **Clonar el repositorio**
    ```bash
    git clone https://github.com/tomasmerlo1/pedidos_app.git
    cd pedidos_app

2. Instalar dependencias
    flutter pub get

3. Ejecutar en modo navegador (Chrome)
    flutter run -d chrome