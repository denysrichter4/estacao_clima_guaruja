import 'package:estacao_clima_guaruja/view/widgets/CustomSingleChild.dart';
import 'package:estacao_clima_guaruja/view/widgets/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartView extends StatefulWidget {
  const ChartView({Key? key, required this.screenSize, required this.controller}) : super(key: key);
  final Size screenSize;
  final ScrollController controller;
  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return CustomSingleChild(
        controller: widget.controller,
        content:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: widget.screenSize.height / 10),
            SizedBox(
                height: widget.screenSize.height * 0.3,
                width: widget.screenSize.width,
                child: const LineChartSample(title: 'Clima em 24H', chartData: list, numSpot: 23,)
            ),
            SizedBox(height: widget.screenSize.height / 10),
            SizedBox(
                height: widget.screenSize.height * 0.3,
                width: widget.screenSize.width,
                child: const LineChartSample(title: 'Clima em 1 mês', chartData: listM, numSpot: 31,)
            ),
            SizedBox(height: widget.screenSize.height / 10),
          ],
        )
    );
  }
  static const list = [
    FlSpot(0, 24),
    FlSpot(1, 32),
    FlSpot(2, 31),
    FlSpot(3, 27),
    FlSpot(4, 22),
    FlSpot(5, 24),
    FlSpot(6, 25),
    FlSpot(7, 28),
    FlSpot(8, 17),
    FlSpot(9, 14),
    FlSpot(10, 15),
    FlSpot(11, 19),
    FlSpot(12, 21),
    FlSpot(13, 25),
    FlSpot(14, 28),
    FlSpot(15, 29),
    FlSpot(16, 30),
    FlSpot(17, 32),
    FlSpot(18, 16),
    FlSpot(19, 11),
    FlSpot(20, 10),
    FlSpot(21, 24),
    FlSpot(22, 17),
    FlSpot(23, 21),
  ];

  static const listM = [
    FlSpot(1, 32),
    FlSpot(2, 31),
    FlSpot(3, 27),
    FlSpot(4, 22),
    FlSpot(5, 24),
    FlSpot(6, 25),
    FlSpot(7, 28),
    FlSpot(8, 17),
    FlSpot(9, 14),
    FlSpot(10, 15),
    FlSpot(11, 19),
    FlSpot(12, 21),
    FlSpot(13, 25),
    FlSpot(14, 28),
    FlSpot(15, 29),
    FlSpot(16, 30),
    FlSpot(17, 32),
    FlSpot(18, 16),
    FlSpot(19, 11),
    FlSpot(20, 10),
    FlSpot(21, 24),
    FlSpot(22, 17),
    FlSpot(23, 21),
    FlSpot(24, 28),
    FlSpot(25, 29),
    FlSpot(26, 30),
    FlSpot(27, 32),
    FlSpot(28, 16),
    FlSpot(29, 11),
    FlSpot(30, 10),
    FlSpot(31, 12),
  ];
}
