import 'package:flutter/material.dart';

class CustomSingleChild extends StatelessWidget {
  const CustomSingleChild({Key? key, required this.content, required this.controller}) : super(key: key);
  final ScrollController controller;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: controller,
        physics: const ClampingScrollPhysics(),
        child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 64),
              child: content
            ),
        )
    );
  }
}
