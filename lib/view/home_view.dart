import 'package:estacao_clima_guaruja/view/widgets/CustomSingleChild.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.screenSize, required this.controller}) : super(key: key);
  final Size screenSize;
  final ScrollController controller;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomSingleChild(
      controller: widget.controller,
      content: const Text(
        "Bem-Vindo!!!",
        style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold
        ),
      )
    );
  }
}
