import 'package:estacao_clima_guaruja/view/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  firebaseInit();
  /**
   * deixar no secrets do github os arquivos do firebase
  **/
  runApp(const MyApp());
}

void firebaseInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estação Clima em Guarujá',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        "/" : (context)=> const HomePage(route: Routes.home),
        Routes.home.name : (context)=> const HomePage(route: Routes.home),
        Routes.chart.name: (context)=> const HomePage(route: Routes.chart),
        Routes.data.name: (context)=> const HomePage(route: Routes.data),
        Routes.machine.name: (context)=> const HomePage(route: Routes.machine),
      },
    );
  }
}
