import 'package:estacao_clima_guaruja/view/widgets/CustomSingleChild.dart';
import 'package:flutter/material.dart';

class MachineView extends StatefulWidget {
  const MachineView({Key? key, required this.screenSize, required this.controller}) : super(key: key);
  final Size screenSize;
  final ScrollController controller;
  @override
  State<MachineView> createState() => _MachineViewState();
}

class _MachineViewState extends State<MachineView> {
  @override
  Widget build(BuildContext context) {
    return CustomSingleChild(
        controller: widget.controller,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: widget.screenSize.height / 10),
            SizedBox(
                height: widget.screenSize.height * 0.3,
                width: widget.screenSize.width,
                child: Container(color: Colors.amber,)
            ),
            SizedBox(height: widget.screenSize.height / 10),
            SizedBox(
                height: widget.screenSize.height * 0.3,
                width: widget.screenSize.width,
                child: Container(color: Colors.cyan,)
            ),
            SizedBox(height: widget.screenSize.height / 10),
          ],
        )
    );
  }
}
