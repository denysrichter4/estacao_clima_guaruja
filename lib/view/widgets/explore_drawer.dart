import 'package:flutter/material.dart';

import '../home_page.dart';

class ExploreDrawer extends StatelessWidget {
  const ExploreDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 32, 0, 16),
              ),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, Routes.data.name);
                },
                child: const Text(
                  'Dados',
                  style: TextStyle(color: Colors.green, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, Routes.chart.name);
                },
                child: const Text(
                  'Gráficos',
                  style: TextStyle(color: Colors.green, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, Routes.machine.name);
                },
                child: const Text(
                  'Machine Learning',
                  style: TextStyle(color: Colors.green, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
