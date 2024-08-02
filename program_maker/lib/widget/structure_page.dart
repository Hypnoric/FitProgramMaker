import 'package:flutter/material.dart';
import 'package:program_maker/widget/big_card.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';

import '../main.dart';

const List<String> structures = <String>[
  "Fullbody x2",
  "Fullbody x3",
  "Push Pull Push Pull",
  "Push Pull Legs Upper Lower",
  "Push Pull Legs Push Pull Legs"
];

class StructurePage extends StatefulWidget {
  @override
  State<StructurePage> createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25),
              Text(
                  'Choose the number of days you want to train to determine the program stucture',
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 25),
              NumberPicker(
                value: appState.numberOfDays,
                minValue: 2,
                maxValue: 6,
                itemHeight: 100,
                axis: Axis.horizontal,
                onChanged: (value) =>
                    setState(() => appState.setNumberOfDays(value)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black26),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => setState(() {
                      final newValue = appState.numberOfDays - 1;
                      appState.setNumberOfDays(newValue.clamp(2, 6));
                    }),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => setState(() {
                      final newValue = appState.numberOfDays + 1;
                      appState.setNumberOfDays(newValue.clamp(2, 6));
                    }),
                  ),
                ],
              ),
              // The text display here is not fluid, would fix with additional time
              // probably because appState.numberOfDays is used for both the number picker and getting the text from structures
              BigCard(text: structures[appState.numberOfDays - 2]),
            ],
          ),
        ),
      ),
    );
  }
}
