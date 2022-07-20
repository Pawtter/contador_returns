import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:contador_returns/forms/form_custom_field.dart';
import 'package:contador_returns/screens/imc/imc_Screen_Controller.dart';
import 'package:flutter/services.dart';

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
  double resultadoImc = 0;
  double altura = 0;
  double peso = 0;

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
              decoration: InputDecoration(
                  hintText: 'Insira sua Altura (em centímetros)'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                  InputDecoration(hintText: 'Insira seu Peso (em kilos)'),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                if (_formKey.currentState!.validate()) {
                  log('processando');
                  log(altura.toString() + ' Altura');
                  log(peso.toString() + ' Peso');
                  resultadoImc = Imc(altura, peso);
                  log(resultadoImc.toString() + ' É o resultado');
                }
              });
            },
            child: const Text('Enviar'),
          ),
          Text(resultadoImc.toString()),
        ],
      ),
    );
  }
}

double Imc(double a, double p) {
  return a / p;
}
