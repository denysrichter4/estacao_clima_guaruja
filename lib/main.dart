import 'package:estacao_clima_guaruja/view/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  /**
   * deixar no secrets do github os arquivos do firebase
  **/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}
