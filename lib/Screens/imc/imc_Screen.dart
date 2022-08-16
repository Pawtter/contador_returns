import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:contador_returns/screens/imc/imc_Screen_Controller.dart';
import 'package:flutter/services.dart';
import 'package:contador_returns/screens/imc/imc_resultado.dart';

CalcularIMC cImc = new CalcularIMC();

class Imc_Screen extends StatefulWidget {
  Imc_Screen({Key? key}) : super(key: key);

  @override
  State<Imc_Screen> createState() => _Imc_ScreenState();
}

class _Imc_ScreenState extends State<Imc_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Center(
        child: FormImc(),
      ),
      bottomNavigationBar: ElevatedButton(
        child: const Text('< Ir ao Contador '),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}

class FormImc extends StatefulWidget {
  FormImc({Key? key}) : super(key: key);

  @override
  State<FormImc> createState() => _FormImcState();
}

class _FormImcState extends State<FormImc> {
  final _formKey = new GlobalKey<FormState>();
  final myControllerAltura = new TextEditingController();
  final myControllerPeso = new TextEditingController();
  num resultadoImc = 0;
  num altura = 0;
  num peso = 0;
  String threshold = 'Insira o valor e inicie o calculo.';

  @override
  void dispose() {
    myControllerAltura.dispose();
    myControllerPeso.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: myControllerAltura,
              decoration: const InputDecoration(
                  hintText: 'Insira sua Altura (em metros)'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
              ],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                altura = double.parse(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Obrigatório';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: myControllerPeso,
              decoration:
                  const InputDecoration(hintText: 'Insira seu Peso (em kilos)'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
              ],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                peso = double.parse(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Obrigatório';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                altura = num.parse(myControllerAltura.text);
                peso = num.parse(myControllerPeso.text);
                if (_formKey.currentState!.validate()) {
                  log('processando');
                  log('$altura Altura');
                  log('$peso Peso');
                  if (resultadoImc >= 40) {
                    threshold = 'Gigante';
                  } else if (resultadoImc >= 25) {
                    threshold = 'Gordin';
                  } else if (resultadoImc >= 18.5) {
                    threshold = 'Saudável';
                  } else {
                    threshold = 'Magrelo';
                  }
                  log('$resultadoImc É o resultado');
                  resultadoImc = cImc.imc(altura, peso);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Imc_Resultado(
                          textoResultado: threshold,
                          resultadoImc: resultadoImc,
                        ),
                      ));
                }
              });
            },
            child: const Text('Enviar'),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'IMC anterior: >$resultadoImc<',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 25),
          ),
          //const Text(
          //  'r=(altura/peso)^2',
          //  style: TextStyle(color: Colors.black26),
          //),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Insira os valores e aperte o botão "enviar"',
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
