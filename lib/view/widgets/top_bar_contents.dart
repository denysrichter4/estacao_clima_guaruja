import 'package:flutter/material.dart';

import '../home_page.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity, {super.key});

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.green.shade900,//.withOpacity(widget.opacity),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Clima Guarujá',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {
                        Navigator.popAndPushNamed(context, Routes.data.name);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Dados',
                            style: TextStyle(
                              color: _isHovering[0]
                                  ? Colors.blue.shade200
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {
                        Navigator.popAndPushNamed(context, Routes.chart.name);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Gráficos',
                            style: TextStyle(
                              color: _isHovering[1]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {
                        Navigator.popAndPushNamed(context, Routes.machine.name);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Machine Learning',
                            style: TextStyle(
                              color: _isHovering[2]
                                  ? Colors.blue[200]
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
