import 'package:flutter/material.dart';
import 'package:program_maker/widget/exercises_page.dart';
import 'package:program_maker/widget/results_page.dart';
import 'package:program_maker/widget/structure_page.dart';
import 'package:program_maker/widget/week_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = StructurePage();
      case 1:
        page = WeekPage();
      case 2:
        page = ExercisesPage();
      case 3:
        page = ResultsPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Structure'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.weekend),
                    label: Text('Week Days'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.sports),
                    label: Text('Exercises'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.abc),
                    label: Text('Results'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
