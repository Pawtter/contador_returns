import 'package:flutter/material.dart';
import 'package:contador_returns/screens/imc/imc_Screen_Controller.dart';

CalcularIMC cImc = new CalcularIMC();

class Imc_Resultado extends StatelessWidget {
  String textoResultado = 'placeholder';
  num resultadoImc = 0;

  Imc_Resultado({
    Key? key,
    required this.textoResultado,
    required this.resultadoImc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do IMC'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              'Você é $textoResultado',
              style: const TextStyle(fontSize: 35),
            ),
            const SizedBox(
              height: 30,
            ),
            Text('e o resultado do IMC é $resultadoImc'),
          ],
        ),
      ),
    );
  }
}
