import 'package:apiaula/pagina1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "API Aula",
      debugShowCheckedModeBanner: false,
      home: Pagina1(),
    );
  }
}
