import 'package:contador_returns/Screens/Home/home_Screen.dart';
import 'package:contador_returns/Screens/contador/contador_Screen.dart';
import 'package:flutter/material.dart';
import 'package:contador_returns/Screens/imc/imc_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Contador_Screen(),
        '/segundaPagina': (context) => Imc_Screen(),
      },
    );
    //return Scaffold(
    //  appBar: AppBar(
    //    title: const Text('Contador Strikes Back'),
    //  ),
    //  bottomNavigationBar: NavigationBar(
    //    destinations: const [
    //      NavigationDestination(
    //        icon: Icon(Icons.add),
    //        label: 'Contador',
    //      ),
    //      NavigationDestination(
    //        icon: Icon(Icons.circle),
    //        label: 'IMC Calc',
    //      ),
    //    ],
    //    onDestinationSelected: ((int index) {
    //      setState(() {
    //        currentPage = index;
    //      });
    //    }),
    //    selectedIndex: currentPage,
    //  ),
    //  body: Contador_Screen(),
    //);
  }
}