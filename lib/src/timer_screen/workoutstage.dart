import 'dart:async';

class WorkoutStage {
  final String id;
  final String name;
  final Duration duration;

  WorkoutStage({required this.id, required this.name, required this.duration});
}

class WorkoutTimerService {
  List<WorkoutStage> stages = [];
  int currentStageIndex = 0;
  late Timer _timer;

  void startWorkout() {
    if (stages.isEmpty) return;
    currentStageIndex = 0;
    _startStage(stages[currentStageIndex]);
  }

  void _startStage(WorkoutStage stage) {
    _timer.cancel(); // Cancel any existing timer
    _timer = Timer(stage.duration, _nextStage);
  }

  void _nextStage() {
    if (currentStageIndex < stages.length - 1) {
      currentStageIndex++;
      _startStage(stages[currentStageIndex]);
    } else {
      print("Workout complete!");
      // Handle workout completion
    }
  }

  void addStage(WorkoutStage stage) {
    stages.add(stage);
  }

  void cancelWorkout() {
    _timer.cancel();
  }
}
