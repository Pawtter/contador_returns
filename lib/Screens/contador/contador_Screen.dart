import 'package:flutter/material.dart';
import 'package:contador_returns/screens/contador/home_Screen_Controller.dart';

Operacoes op = new Operacoes();

class Contador_Screen extends StatefulWidget {
  Contador_Screen({Key? key}) : super(key: key);

  @override
  State<Contador_Screen> createState() => _Contador_ScreenState();
}

class _Contador_ScreenState extends State<Contador_Screen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${op.contador}',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      op.adicionar();
                    });
                  },
                  child: const Text('Adicionar'),
                ),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      op.subtrair();
                    });
                  },
                  child: const Text('Subtrair'),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        child: const Text('Ir ao IMC > '),
        onPressed: () {
          Navigator.pushNamed(context, '/segundaPagina');
        },
      ),
    );
  }
}
