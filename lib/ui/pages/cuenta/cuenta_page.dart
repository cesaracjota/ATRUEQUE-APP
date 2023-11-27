import 'package:flutter/material.dart';

class CuentaScreen extends StatefulWidget {
  const CuentaScreen({super.key});

  @override
  State<CuentaScreen> createState() => _CuentaScreenState();
}

class _CuentaScreenState extends State<CuentaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Pagina de Cuenta")),
    );
  }
}
