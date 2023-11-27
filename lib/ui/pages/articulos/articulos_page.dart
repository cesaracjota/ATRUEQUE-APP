import 'package:flutter/material.dart';

class ArticulosScreen extends StatefulWidget {
  const ArticulosScreen({super.key});

  @override
  State<ArticulosScreen> createState() => _ArticulosScreenState();
}

class _ArticulosScreenState extends State<ArticulosScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Pagina de Articulos")),
    );
  }
}
