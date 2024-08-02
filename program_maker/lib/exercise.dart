class Exercise {
  static const Exercise pushup = Exercise("Push-Ups", "chest", "push", true, false);
  static const Exercise bench = Exercise("Bench Press", "chest", "push", true, false);
  static const Exercise pike =
      Exercise("Pike Push-ups", "shoulder", "push", true, false);
  static const Exercise overhead =
      Exercise("Overhead Press", "shoulder", "push", true, false);
  static const Exercise dbcurl =
      Exercise("Dumbbell Curls", "bicep", "pull", true, false);
  static const Exercise bodycurl =
      Exercise("Bodyweight Curls", "bicep", "pull", true, false);
  static const Exercise pullup = Exercise("Pull-ups", "back", "pull", false, false);
  static const Exercise row = Exercise("Rows", "back", "pull", false, false);
  static const Exercise squat =
      Exercise("Barbell Squat", "quad", "push", false, true);
  static const Exercise pistol =
      Exercise("Pistol Squat", "quad", "push", false, true);
  static const Exercise deadlift =
      Exercise("Deadlift", "hamstring", "pull", false, true);
  static const Exercise nordic =
      Exercise("Nordic Curls", "hamstring", "pull", false, true);

  final String name;
  final String muscle;
  final String type;
  final bool isUpperBody;
  final bool isLegs;

  const Exercise(this.name, this.muscle, this.type, this.isUpperBody, this.isLegs);
}
