import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:program_maker/widget/big_card.dart';

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
  final List<bool> _selectedDays = <bool>[false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final int maxDays = 3; // get from appstate

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
                    for (int buttonIndex = 0; buttonIndex < _selectedDays.length; buttonIndex++) {
                      numberSelected = numberSelected + (_selectedDays.elementAt(buttonIndex) ? 1 : 0);
                    }
                    if (_selectedDays.elementAt(index) || numberSelected < maxDays) {
                      _selectedDays[index] = !_selectedDays[index];
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
                isSelected: _selectedDays,
                children: days,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
