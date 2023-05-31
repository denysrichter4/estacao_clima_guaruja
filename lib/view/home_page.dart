import 'package:flutter/material.dart';
import 'chart_view.dart';
import 'data_view.dart';
import 'home_view.dart';
import 'ml_view.dart';
import 'widgets/explore_drawer.dart';
import 'widgets/responsive.dart';
import 'widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.route});
  final Routes route;
  @override
  State<HomePage> createState() => _HomePageState();
}

enum Routes{
  home,
  chart,
  data,
  machine,
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  Widget getRoute(Size screenSize){
    switch(widget.route){
      case Routes.home : {
        return HomeView(screenSize: screenSize, controller: _scrollController);
      }
      case Routes.chart : {
        return ChartView(screenSize: screenSize, controller: _scrollController);
      }
      case Routes.data : {
        return DataView(screenSize: screenSize,);
      }
      case Routes.machine : {
        return MachineView(screenSize: screenSize, controller: _scrollController);
      }
      default:{
        return HomeView(screenSize: screenSize, controller: _scrollController);
      }
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.green.shade100,//.withOpacity(_opacity),
              elevation: 0,
              title: Image.asset(
                "assets/estacao_clima_logo.png",
                height: 40,
                width: 150,
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),

      drawer: const ExploreDrawer(),
      body: getRoute(screenSize),
    );
  }
}
