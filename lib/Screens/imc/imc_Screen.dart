import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:contador_returns/screens/imc/imc_Screen_Controller.dart';

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
  final _formChave = GlobalKey<_FormImcState>();
  int valorIMC = 0;
  String gordo = 'Entre com os valores nos campos abaixo e aperte o botão.';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(gordo),
        Padding(
          padding: const EdgeInsets.all(15.0),
          //  child: Form(
          //    key: _formChave,
          //    child: Column(
          //      children: [
          //        TextFormField(
          //          //decoration: const InputDecoration(
          //          //    icon: Icon(Icons.height),
          //          //    hintText: 'Insira sua altura.',
          //          //    labelText: 'Altura'),
          //          validator: ((textoInserido) {
          //            if (textoInserido == null || textoInserido.isEmpty) {
          //              return 'Insira algum valor numérico';
          //            }
          //            return null;
          //          }),
          //        ),
          //        TextFormField(
          //          //decoration: const InputDecoration(
          //          //    icon: Icon(Icons.fastfood),
          //          //    hintText: 'Insira seu peso.',
          //          //    labelText: 'Peso'),
          //          validator: ((textoInserido) {
          //            if (textoInserido == null || textoInserido.isEmpty) {
          //              return 'Insira algum valor numérico';
          //            }
          //            return null;
          //          }),
          //        ),
          //        ElevatedButton(
          //          onPressed: () {
          //            setState(() {
          //              if (_formChave.currentState == null) {
          //                gordo == 'Tudo Vazio';
          //              } else {
          //                gordo == 'Valores inseridos';
          //              }
          //            });
          //          },
          //          child: const Text('Calcular!'),
          //        ),
          //      ],
          //    ),
          //  ),
        ),
        Form(
          key: _formChave,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Insira algo';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formChave.currentState == null) {
                    log('_formChave é nullo');
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
