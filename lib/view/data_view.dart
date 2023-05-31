import 'dart:collection';
import 'dart:convert';

import 'package:estacao_clima_guaruja/view/widgets/item_tile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../model/firebase_model.dart';

class DataView extends StatefulWidget {
  const DataView({Key? key, required this.screenSize}) : super(key: key);
  final Size screenSize;
  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  late DatabaseReference itemsRef;

  @override
  void initState() {
    itemsRef = FirebaseDatabase.instance.ref("ESP_32");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Dados coletados a cada minuto pelo sensor BMP280 em um ESP32",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              maxLines: 3,
              textAlign: TextAlign.start,
            ),
          ),
          body: Container(

            padding: const EdgeInsets.all(16),
            alignment: Alignment.topCenter,
            child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: StreamBuilder(
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
                      map.forEach((key, value) {
                        ItemFirebase itemFirebase = ItemFirebase.fromJson(value);
                        items.add({key:itemFirebase});
                      });
                      for (var i = (items.length - 1); i > 0; i--){
                        itemsReversed.add(items[i]);
                      }
                      return ListView.builder(
                          reverse: false,
                          padding: const EdgeInsets.only(top: 16, left: 2, right: 2, bottom: 120),
                          itemCount: itemsReversed.length,
                          itemBuilder: (ctx, i) =>
                              ItemTile(item: itemsReversed[i])
                      );

                    }else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
            ),
          )
      ),
    );
  }
}
