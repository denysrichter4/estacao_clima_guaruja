import 'package:estacao_clima_guaruja/view/widgets/line_chart.dart';
import 'package:flutter/material.dart';

class ChartView extends StatefulWidget {
  const ChartView({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;
  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: widget.screenSize.height / 10),
        SizedBox(
            height: widget.screenSize.height * 0.3,
            width: widget.screenSize.width,
            child: const LineChartSample1(title: 'Clima em 24H', )
        ),
        SizedBox(height: widget.screenSize.height / 10),
        SizedBox(
            height: widget.screenSize.height * 0.3,
            width: widget.screenSize.width,
            child: const LineChartSample1(title: 'Clima em 1 mês', )
        ),
        SizedBox(height: widget.screenSize.height / 10),
      ],
    );
  }
}
