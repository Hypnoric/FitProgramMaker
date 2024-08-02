
import 'package:flutter/material.dart';
import 'package:program_maker/main.dart';
import 'package:provider/provider.dart';

const List<Widget> days = <Widget>[
  Text('Monday'),
  Text('Tuesday'),
  Text('Wednesday'),
  Text('Thursday'),
  Text('Friday'),
  Text('Saturday'),
  Text('Sunday')
];

class WeekPage extends StatefulWidget {
  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final ThemeData theme = Theme.of(context);
    final int maxDays = appState.numberOfDays;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ToggleButtons with a multiple selection.
              Text('Select the days you want to train', style: theme.textTheme.titleSmall),
              const SizedBox(height: 15),
              ToggleButtons(
                onPressed: (int index) {
                  // All buttons are selectable.
                  setState(() {
                    var numberSelected = 0;
                    for (int buttonIndex = 0; buttonIndex < appState.selectedDays.length; buttonIndex++) {
                      numberSelected = numberSelected + (appState.selectedDays.elementAt(buttonIndex) ? 1 : 0);
                    }
                    if (appState.selectedDays.elementAt(index) || numberSelected < maxDays) {
                      appState.toggleSelectedDay(index);
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.green[700],
                selectedColor: Colors.white,
                fillColor: Colors.green[200],
                color: Colors.green[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: appState.selectedDays,
                children: days,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
