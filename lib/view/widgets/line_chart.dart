import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class LineChartCustom extends StatelessWidget {
  const LineChartCustom({super.key, required this.chartData, required this.numSpot,});

  final List<FlSpot> chartData;
  final double numSpot;
  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: numSpot,
    maxY: 45,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0ºC';
        break;
      case 10:
        text = '10ºC';
        break;
      case 20:
        text = '20ºC';
        break;
      case 30:
        text = '30ºC';
        break;
      case 40:
        text = '40ºC';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 5,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('1', style: style);
        break;
      case 2:
        text = const Text('2', style: style);
        break;
      case 3:
        text = const Text('3', style: style);
        break;
      case 4:
        text = const Text('4', style: style);
        break;
      case 5:
        text = const Text('5', style: style);
        break;
      case 6:
        text = const Text('6', style: style);
        break;
      case 7:
        text = const Text('7', style: style);
        break;
      case 8:
        text = const Text('8', style: style);
        break;
      case 9:
        text = const Text('9', style: style);
        break;
      case 10:
        text = const Text('10', style: style);
        break;
      case 11:
        text = const Text('11', style: style);
        break;
      case 12:
        text = const Text('12', style: style);
        break;
      case 13:
        text = const Text('13', style: style);
        break;
      case 14:
        text = const Text('14', style: style);
        break;
      case 15:
        text = const Text('15', style: style);
        break;
      case 16:
        text = const Text('16', style: style);
        break;
      case 17:
        text = const Text('17', style: style);
        break;
      case 18:
        text = const Text('18', style: style);
        break;
      case 19:
        text = const Text('19', style: style);
        break;
      case 20:
        text = const Text('20', style: style);
        break;
      case 21:
        text = const Text('21', style: style);
        break;
      case 22:
        text = const Text('22', style: style);
        break;
      case 23:
        text = const Text('23', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    if(value.toInt() > 23){
      switch (value.toInt()) {
        case 24:
          text = const Text('24', style: style);
          break;
        case 25:
          text = const Text('25', style: style);
          break;
        case 26:
          text = const Text('26', style: style);
          break;
        case 27:
          text = const Text('27', style: style);
          break;
        case 28:
          text = const Text('28', style: style);
          break;
        case 29:
          text = const Text('29', style: style);
          break;
        case 30:
          text = const Text('30', style: style);
          break;
        case 31:
          text = const Text('31', style: style);
          break;
        default:
          text = const Text('');
          break;
      }
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom:
      BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
      left: const BorderSide(color: Colors.transparent),
      right: const BorderSide(color: Colors.transparent),
      top: const BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    color: AppColors.contentColorGreen,
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: chartData,
  );
}

class LineChartSample extends StatefulWidget {
  const LineChartSample({super.key, required this.title, required this.chartData, required this.numSpot});
  final String title;
  final List<FlSpot> chartData;
  final double numSpot;
  @override
  State<StatefulWidget> createState() => LineChartSampleState();
}

class LineChartSampleState extends State<LineChartSample> {

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.title,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: SizedBox(
              height: 135,
              width: 1200,
              child: Center(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      width: 1100,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 6),
                        child: LineChartCustom(chartData: widget.chartData, numSpot: widget.numSpot,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}