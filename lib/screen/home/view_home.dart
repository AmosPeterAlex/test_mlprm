import 'package:flutter/material.dart';
import 'package:test_nexteons/responsive_layout_builder.dart';
import 'package:test_nexteons/screen/home/responsive/lap_home.dart';
import 'package:test_nexteons/screen/home/responsive/mobile_home.dart';
import 'package:test_nexteons/screen/home/responsive/tab_home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        lapView: LapHome(), mobView: MobileHome(), tabView: TabHome());
  }
}
