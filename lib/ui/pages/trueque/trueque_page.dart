import 'package:flutter/material.dart';

class TruequeScreen extends StatefulWidget {
  const TruequeScreen({super.key});

  @override
  State<TruequeScreen> createState() => _TruequeScreenState();
}

class _TruequeScreenState extends State<TruequeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Pagina de Trueques")),
    );
  }
}
