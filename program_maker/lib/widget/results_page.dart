import 'package:flutter/material.dart';
import 'package:program_maker/widget/big_card.dart';
import 'package:program_maker/widget/small_card.dart';
import 'package:provider/provider.dart';

import '../main.dart';

List<Widget> createDay(String day) {
  return <Widget>[
    BigCard(text: day),
    SizedBox(height: 10),
  ];
}

class Day {
  String name = "";
  List<Widget> widgets = [];

  Day(this.name, this.widgets);
}

class ResultsPage extends StatelessWidget {
  var week = <Day>[
    Day("Monday", createDay("Monday")),
    Day("Tuesday", createDay("Tuesday")),
    Day("Wednesday", createDay("Wednesday")),
    Day("Thursday", createDay("Thursday")),
    Day("Friday", createDay("Friday")),
    Day("Saturday", createDay("Saturday")),
    Day("Sunday", createDay("Sunday")),
  ];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var structure = <String>[];
    switch (appState.numberOfDays) {
      case 2:
      case 3:
        for (int i = 0; i < appState.selectedDays.length; i++) {
          if (appState.selectedDays[i]) {
            for (int j = 0; j < appState.selectedExercises.length; j++) {
              week[i]
                  .widgets
                  .add(SmallCard(text: appState.selectedExercises[j].name));
            }
          }
        }
      case 4:
        var counter = 0;
        structure = ["push", "pull", "push", "pull"];
        for (int i = 0; i < appState.selectedDays.length; i++) {
          if (appState.selectedDays[i]) {
            for (int j = 0; j < appState.selectedExercises.length; j++) {
              if (appState.selectedExercises[j].type == structure[counter]) {
                week[i]
                    .widgets
                    .add(SmallCard(text: appState.selectedExercises[j].name));
              }
            }
            counter++;
          }
        }
      case 5:
        structure = ["push", "pull", "legs", "upper", "lower"];
        var counter = 0;
        for (int i = 0; i < appState.selectedDays.length; i++) {
          if (appState.selectedDays[i]) {
            for (int j = 0; j < appState.selectedExercises.length; j++) {
              if (appState.selectedExercises[j].type == structure[counter] &&
                      counter < 2 ||
                  counter == 2 && appState.selectedExercises[j].isLegs ||
                  counter == 3 && appState.selectedExercises[j].isUpperBody ||
                  counter == 4 && !appState.selectedExercises[j].isUpperBody) {
                week[i]
                    .widgets
                    .add(SmallCard(text: appState.selectedExercises[j].name));
              }
            }
            counter++;
          }
        }
      case 6:
        structure = [
          "push",
          "pull",
          "legs",
          "push",
          "pull",
          "legs",
        ];
        var counter = 0;
        for (int i = 0; i < appState.selectedDays.length; i++) {
          if (appState.selectedDays[i]) {
            for (int j = 0; j < appState.selectedExercises.length; j++) {
              if (appState.selectedExercises[j].type == structure[counter] &&
                      counter % 3 != 2 &&
                      !appState.selectedExercises[j].isLegs ||
                  counter % 3 == 2 && appState.selectedExercises[j].isLegs) {
                week[i]
                    .widgets
                    .add(SmallCard(text: appState.selectedExercises[j].name));
              }
            }
            counter++;
          }
        }
      default:
        throw UnimplementedError('no structure for this number of days');
    }

    return Builder(builder: (context) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: week[0].widgets,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: week[1].widgets,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: week[2].widgets,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: week[3].widgets,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: week[4].widgets,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: week[5].widgets,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: week[6].widgets,
              ),
            ),
          ],
        ),
      );
    });
  }
}
