import 'package:flutter/material.dart';
import 'package:program_maker/exercise.dart';
import 'package:provider/provider.dart';

import 'widget/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Fitness Program Maker',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 60, 250, 225)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var numberOfDays = 2;
  void setNumberOfDays(int value) {
    numberOfDays = value;
    // Reset the selected days so we don't have more days than the selected number
    selectedDays = <bool>[false, false, false, false, false, false, false];
    notifyListeners();
  }

  var selectedDays = <bool>[false, false, false, false, false, false, false];
  void toggleSelectedDay(int index) {
    selectedDays[index] = !selectedDays[index];
    notifyListeners();
  }

  var selectedExercises = <Exercise>[];
  void addExercise(Exercise ex) {
    selectedExercises.add(ex);
    notifyListeners();
  }
  void removeExercise(Exercise ex) {
    selectedExercises.remove(ex);
    notifyListeners();
  }
}