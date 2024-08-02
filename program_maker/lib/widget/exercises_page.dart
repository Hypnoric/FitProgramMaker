import 'package:flutter/material.dart';
import 'package:program_maker/exercise.dart';
import 'package:provider/provider.dart';

import '../main.dart';

// I know this page would need some reformatting, create some class that would do all the repetitive steps for each exercice type
const List<Exercise> chestExercises = <Exercise>[
  Exercise.pushup,
  Exercise.bench,
];

const List<Exercise> shoulderExercises = <Exercise>[
  Exercise.pike,
  Exercise.overhead,
];

const List<Exercise> bicepExercises = <Exercise>[
  Exercise.bodycurl,
  Exercise.dbcurl,
];

const List<Exercise> backExercises = <Exercise>[
  Exercise.pullup,
  Exercise.row,
];

const List<Exercise> quadExercises = <Exercise>[
  Exercise.pistol,
  Exercise.squat,
];

const List<Exercise> hamstringExercises = <Exercise>[
  Exercise.nordic,
  Exercise.deadlift,
];

class ExercisesPage extends StatefulWidget {
  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  var chestWidgets = <Widget>[];
  var shoulderWidgets = <Widget>[];
  var bicepWidgets = <Widget>[];
  var backWidgets = <Widget>[];
  var quadWidgets = <Widget>[];
  var hamstringWidgets = <Widget>[];

  var selectedChest = <bool>[];
  var selectedShoulder = <bool>[];
  var selectedBicep = <bool>[];
  var selectedBack = <bool>[];
  var selectedQuad = <bool>[];
  var selectedHamstring = <bool>[];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < chestExercises.length; i++) {
      chestWidgets.add(Text(chestExercises[i].name));
      selectedChest.add(false);
    }
    for (int i = 0; i < shoulderExercises.length; i++) {
      shoulderWidgets.add(Text(shoulderExercises[i].name));
      selectedShoulder.add(false);
    }
    for (int i = 0; i < bicepExercises.length; i++) {
      bicepWidgets.add(Text(bicepExercises[i].name));
      selectedBicep.add(false);
    }
    for (int i = 0; i < backExercises.length; i++) {
      backWidgets.add(Text(backExercises[i].name));
      selectedBack.add(false);
    }
    for (int i = 0; i < quadExercises.length; i++) {
      quadWidgets.add(Text(quadExercises[i].name));
      selectedQuad.add(false);
    }
    for (int i = 0; i < hamstringExercises.length; i++) {
      hamstringWidgets.add(Text(hamstringExercises[i].name));
      selectedHamstring.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final ThemeData theme = Theme.of(context);

    for (int i = 0; i < chestExercises.length; i++) {
      selectedChest[i] = appState.selectedExercises.contains(chestExercises[i]);
    }
    for (int i = 0; i < shoulderExercises.length; i++) {
      selectedShoulder[i] =
          appState.selectedExercises.contains(shoulderExercises[i]);
    }
    for (int i = 0; i < bicepExercises.length; i++) {
      selectedBicep[i] = appState.selectedExercises.contains(bicepExercises[i]);
    }
    for (int i = 0; i < backExercises.length; i++) {
      selectedBack[i] = appState.selectedExercises.contains(backExercises[i]);
    }
    for (int i = 0; i < quadExercises.length; i++) {
      selectedQuad[i] = appState.selectedExercises.contains(quadExercises[i]);
    }
    for (int i = 0; i < hamstringExercises.length; i++) {
      selectedHamstring[i] =
          appState.selectedExercises.contains(hamstringExercises[i]);
    }

    return Builder(builder: (context) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Chest ToggleButtons.
                  Text('Chest', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 5),
                  ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        appState.selectedExercises
                            .removeWhere((item) => item.muscle == "chest");
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < chestWidgets.length; i++) {
                          if (i == index) {
                            selectedChest[i] = true;
                            appState.selectedExercises.add(chestExercises[i]);
                          } else {
                            selectedChest[i] = false;
                          }
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
                    isSelected: selectedChest,
                    children: chestWidgets,
                  ),

                  const SizedBox(height: 20),

                  // Shoulder ToggleButtons.
                  Text('Shoulder', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 5),
                  ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        appState.selectedExercises
                            .removeWhere((item) => item.muscle == "shoulder");
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < shoulderWidgets.length; i++) {
                          if (i == index) {
                            selectedShoulder[i] = true;
                            appState.selectedExercises
                                .add(shoulderExercises[i]);
                          } else {
                            selectedShoulder[i] = false;
                          }
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
                    isSelected: selectedShoulder,
                    children: shoulderWidgets,
                  ),

                  const SizedBox(height: 20),

                  // Bicep ToggleButtons.
                  Text('Bicep', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 5),
                  ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        appState.selectedExercises
                            .removeWhere((item) => item.muscle == "bicep");
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < bicepWidgets.length; i++) {
                          if (i == index) {
                            selectedBicep[i] = true;
                            appState.selectedExercises.add(bicepExercises[i]);
                          } else {
                            selectedBicep[i] = false;
                          }
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
                    isSelected: selectedBicep,
                    children: bicepWidgets,
                  ),

                  const SizedBox(height: 20),

                  // Back ToggleButtons.
                  Text('Back', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 5),
                  ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        appState.selectedExercises
                            .removeWhere((item) => item.muscle == "back");
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < backWidgets.length; i++) {
                          if (i == index) {
                            selectedBack[i] = true;
                            appState.selectedExercises.add(backExercises[i]);
                          } else {
                            selectedBack[i] = false;
                          }
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
                    isSelected: selectedBack,
                    children: backWidgets,
                  ),

                  const SizedBox(height: 20),

                  // Quad ToggleButtons.
                  Text('Quad', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 5),
                  ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        appState.selectedExercises
                            .removeWhere((item) => item.muscle == "quad");
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < quadWidgets.length; i++) {
                          if (i == index) {
                            selectedQuad[i] = true;
                            appState.selectedExercises.add(quadExercises[i]);
                          } else {
                            selectedQuad[i] = false;
                          }
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
                    isSelected: selectedQuad,
                    children: quadWidgets,
                  ),

                  const SizedBox(height: 20),

                  // Hamstring ToggleButtons.
                  Text('Hamstring', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 5),
                  ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        appState.selectedExercises
                            .removeWhere((item) => item.muscle == "hamstring");
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < hamstringWidgets.length; i++) {
                          if (i == index) {
                            selectedHamstring[i] = true;
                            appState.selectedExercises
                                .add(hamstringExercises[i]);
                          } else {
                            selectedHamstring[i] = false;
                          }
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
                    isSelected: selectedHamstring,
                    children: hamstringWidgets,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
