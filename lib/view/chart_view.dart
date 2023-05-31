import 'dart:convert';
import 'dart:html';
import 'dart:js_interop';

import 'package:estacao_clima_guaruja/view/widgets/CustomSingleChild.dart';
import 'package:estacao_clima_guaruja/view/widgets/line_chart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/firebase_model.dart';

class ChartView extends StatefulWidget {
  const ChartView({Key? key, required this.screenSize, required this.controller}) : super(key: key);
  final Size screenSize;
  final ScrollController controller;
  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  late DatabaseReference itemsRef;

  @override
  void initState() {
    itemsRef = FirebaseDatabase.instance.ref("ESP_32");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: itemsRef.onValue,
      builder: (context, snapshot){
        if(snapshot.hasData && !snapshot.hasError) {
          var event = snapshot.data as DatabaseEvent;
          var snapshot2 = event.snapshot.value;
          if (snapshot2 == null) {
            return const Center(child: Text("Sem items na lista"),);
          }
          var encoded = jsonEncode(snapshot2);
          Map<String, dynamic> map = Map<String, dynamic>.from(jsonDecode(encoded.toString()));

          List<Map<String, ItemFirebase>> items = <Map<String, ItemFirebase>>[];
          List<Map<String, ItemFirebase>> itemsReversed = <Map<String, ItemFirebase>>[];
          List<FlSpot> listD = [FlSpot(0,0)];
          List<FlSpot> listH = [FlSpot(0,0)];
          map.forEach((key, value) {
            ItemFirebase itemFirebase = ItemFirebase.fromJson(value);
            var keySubs = double.parse(key.substring(8, 10)).toInt();
            var keySubsH = double.parse(key.substring(11, 13)).toInt();
            var keySubsM = double.parse(key.substring(14, 15)).toInt();
            if(keySubs < 32 && keySubsH == 17 && keySubsM == 3 && !itemFirebase.temperatura.isNull){
              print("${itemFirebase.temperatura}");
              listD.add(FlSpot(keySubs.toDouble(), itemFirebase.temperatura!));
            }
            items.add({key:itemFirebase});
          });
          for (var i = (items.length - 1); i > 0; i--){
            itemsReversed.add(items[i]);
          }

          for (var element in itemsReversed) {
            element.forEach((key, value) {
              var keySubs = double.parse(key.substring(11, 13)).toInt();
              var keySubsM = double.parse(key.substring(14, 15)).toInt();
              if(keySubs < 24 && keySubsM == 3 && !value.temperatura.isNull){
                print("${value.temperatura}");
                listH.add(FlSpot(keySubs.toDouble(), value.temperatura!.toDouble()));
              }
            });
          }



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

        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
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
