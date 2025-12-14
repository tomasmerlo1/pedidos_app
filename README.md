# Pedidos App — Frontend en Flutter

Esta es la **aplicación frontend** desarrollada con **Flutter** para consumir la API de pedidos implementada en Node.js y desplegada en Render.

La app permite:
- Ver la lista de clientes
- Ver la lista de productos
- Ver y crear pedidos
- Consultar el detalle de cada pedido

Se comunica con una API REST que expone los datos de clientes, productos, pedidos y detalles.

---

## 🚀 Tecnologías

Esta app fue construida con:

- Flutter SDK
- Dart
- Librería `http` para consumir la API
- Ejecución en **Web (Chrome)**

---

## 🔗 Backend

La aplicación consume la API desplegada en Render:

👉 https://api-pedidos-pmbg.onrender.com

La API está protegida mediante una **API Key**, enviada en los headers de cada request:

x-api-key: 123456

## 📦 Instalación y ejecución

1. **Clonar el repositorio**

    git clone https://github.com/tomasmerlo1/pedidos_app.git
    cd pedidos_app

2. **Instalar dependencias**
    flutter pub get

3. **Ejecutar en modo navegador (Chrome)**
    flutter run -d chrome