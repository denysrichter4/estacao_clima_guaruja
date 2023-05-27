import 'package:estacao_clima_guaruja/view/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../../model/firebase_model.dart';

class ItemTile extends StatelessWidget{
  final Map<String, ItemFirebase> item;
  ItemTile({super.key, required this.item});

  ItemFirebase content = ItemFirebase();
  String time = "";

  void getItem(){
    item.forEach((key, value) {
      time = key;
      content = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    getItem();
    return Card(
        child: Row(
          children: [
            Container(
              height: 120,
              width: 260,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Data: $time",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Temperatura: ${content.temperatura?.toStringAsFixed(1)} ºC",
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Pressão: ${content.pressao?.toStringAsFixed(1)} Pa",
                    style: const TextStyle(
                      color: Colors.black45,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}