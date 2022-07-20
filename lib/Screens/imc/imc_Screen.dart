import 'package:flutter/material.dart';
import 'package:contador_returns/forms/form_custom_field.dart';
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
  final _formKey = GlobalKey<_FormImcState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormField(
            hintText: 'Insira sua Altura',
            validator: (valor) {
              if (!valor.CheckNum) {
                return 'Campo Obrigatório.';
              }
            },
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
