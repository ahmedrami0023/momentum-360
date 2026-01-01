/// Mock data service for populating sample data
/// Useful for development, testing, and demos
class MockDataService {
  MockDataService._();

  static final MockDataService instance = MockDataService._();

  /// Generate sample exercises for the library
  List<Map<String, dynamic>> getSampleExercises() {
    return [
      // Push Exercises
      {
        'id': 'ex_001',
        'name': 'Barbell Bench Press',
        'category': 'Push',
        'muscleGroups': ['Chest', 'Triceps', 'Shoulders'],
        'equipment': 'Barbell',
        'instructions': 'Lie on bench, lower bar to chest, press up',
      },
      {
        'id': 'ex_002',
        'name': 'Overhead Press',
        'category': 'Push',
        'muscleGroups': ['Shoulders', 'Triceps'],
        'equipment': 'Barbell',
        'instructions': 'Press barbell overhead from shoulder height',
      },
      {
        'id': 'ex_003',
        'name': 'Dumbbell Incline Press',
        'category': 'Push',
        'muscleGroups': ['Chest', 'Shoulders'],
        'equipment': 'Dumbbells',
        'instructions': 'Press dumbbells on incline bench',
      },
      {
        'id': 'ex_004',
        'name': 'Dips',
        'category': 'Push',
        'muscleGroups': ['Chest', 'Triceps'],
        'equipment': 'Bodyweight',
        'instructions': 'Lower body between parallel bars, push back up',
      },

      // Pull Exercises
      {
        'id': 'ex_005',
        'name': 'Barbell Row',
        'category': 'Pull',
        'muscleGroups': ['Back', 'Biceps'],
        'equipment': 'Barbell',
        'instructions': 'Pull barbell to lower chest while bent over',
      },
      {
        'id': 'ex_006',
        'name': 'Pull-ups',
        'category': 'Pull',
        'muscleGroups': ['Back', 'Biceps'],
        'equipment': 'Bodyweight',
        'instructions': 'Pull body up until chin clears bar',
      },
      {
        'id': 'ex_007',
        'name': 'Lat Pulldown',
        'category': 'Pull',
        'muscleGroups': ['Back', 'Biceps'],
        'equipment': 'Cable Machine',
        'instructions': 'Pull bar down to upper chest',
      },
      {
        'id': 'ex_008',
        'name': 'Dumbbell Curls',
        'category': 'Pull',
        'muscleGroups': ['Biceps'],
        'equipment': 'Dumbbells',
        'instructions': 'Curl dumbbells up to shoulders',
      },

      // Leg Exercises
      {
        'id': 'ex_009',
        'name': 'Barbell Squat',
        'category': 'Legs',
        'muscleGroups': ['Legs', 'Glutes'],
        'equipment': 'Barbell',
        'instructions': 'Squat down with barbell on back, stand back up',
      },
      {
        'id': 'ex_010',
        'name': 'Deadlift',
        'category': 'Legs',
        'muscleGroups': ['Legs', 'Back', 'Glutes'],
        'equipment': 'Barbell',
        'instructions': 'Lift barbell from ground to hip height',
      },
      {
        'id': 'ex_011',
        'name': 'Leg Press',
        'category': 'Legs',
        'muscleGroups': ['Legs', 'Glutes'],
        'equipment': 'Machine',
        'instructions': 'Press platform away with feet',
      },
      {
        'id': 'ex_012',
        'name': 'Romanian Deadlift',
        'category': 'Legs',
        'muscleGroups': ['Glutes', 'Legs'],
        'equipment': 'Barbell',
        'instructions': 'Hinge at hips, lower bar to shins',
      },
      {
        'id': 'ex_013',
        'name': 'Leg Curl',
        'category': 'Legs',
        'muscleGroups': ['Legs'],
        'equipment': 'Machine',
        'instructions': 'Curl legs up towards glutes',
      },

      // Core Exercises
      {
        'id': 'ex_014',
        'name': 'Plank',
        'category': 'Core',
        'muscleGroups': ['Core'],
        'equipment': 'Bodyweight',
        'instructions': 'Hold push-up position on forearms',
      },
      {
        'id': 'ex_015',
        'name': 'Hanging Leg Raises',
        'category': 'Core',
        'muscleGroups': ['Core'],
        'equipment': 'Pull-up Bar',
        'instructions': 'Raise legs while hanging from bar',
      },
      {
        'id': 'ex_016',
        'name': 'Russian Twists',
        'category': 'Core',
        'muscleGroups': ['Core'],
        'equipment': 'Bodyweight',
        'instructions': 'Twist torso side to side while seated',
      },

      // Cardio
      {
        'id': 'ex_017',
        'name': 'Running',
        'category': 'Cardio',
        'muscleGroups': ['Legs'],
        'equipment': 'None',
        'instructions': 'Run at steady pace or intervals',
      },
      {
        'id': 'ex_018',
        'name': 'Cycling',
        'category': 'Cardio',
        'muscleGroups': ['Legs'],
        'equipment': 'Bike',
        'instructions': 'Cycle at steady pace or intervals',
      },
    ];
  }

  /// Generate sample workout
  Map<String, dynamic> getSampleWorkout() {
    return {
      'id': 'workout_001',
      'name': 'Upper Body Push',
      'date': DateTime.now().toIso8601String(),
      'duration': 3600, // seconds
      'exercises': [
        {
          'exerciseId': 'ex_001',
          'exerciseName': 'Barbell Bench Press',
          'sets': [
            {'reps': 10, 'weight': 60.0, 'rpe': 7},
            {'reps': 8, 'weight': 70.0, 'rpe': 8},
            {'reps': 6, 'weight': 80.0, 'rpe': 9},
          ],
        },
        {
          'exerciseId': 'ex_002',
          'exerciseName': 'Overhead Press',
          'sets': [
            {'reps': 8, 'weight': 40.0, 'rpe': 7},
            {'reps': 8, 'weight': 45.0, 'rpe': 8},
            {'reps': 6, 'weight': 50.0, 'rpe': 9},
          ],
        },
      ],
      'notes': 'Great workout! Felt strong today.',
    };
  }

  /// Generate sample meal
  Map<String, dynamic> getSampleMeal() {
    return {
      'id': 'meal_001',
      'name': 'Breakfast',
      'date': DateTime.now().toIso8601String(),
      'foods': [
        {
          'name': 'Oatmeal',
          'calories': 150,
          'protein': 5,
          'carbs': 27,
          'fat': 3,
          'serving': '1 cup',
        },
        {
          'name': 'Banana',
          'calories': 105,
          'protein': 1,
          'carbs': 27,
          'fat': 0,
          'serving': '1 medium',
        },
        {
          'name': 'Eggs',
          'calories': 140,
          'protein': 12,
          'carbs': 1,
          'fat': 10,
          'serving': '2 large',
        },
      ],
      'notes': 'Pre-workout meal',
    };
  }

  /// Generate default nutrition goals
  Map<String, dynamic> getDefaultNutritionGoals() {
    return {'calories': 2000, 'protein': 150, 'carbs': 200, 'fat': 65};
  }

  /// Generate sample body measurement
  Map<String, dynamic> getSampleBodyMeasurement() {
    return {
      'id': 'measurement_001',
      'date': DateTime.now().toIso8601String(),
      'weight': 70.0,
      'chest': 100.0,
      'waist': 80.0,
      'arms': 35.0,
      'legs': 55.0,
      'notes': '',
    };
  }

  /// Generate sample cardio session
  Map<String, dynamic> getSampleCardioSession() {
    return {
      'id': 'cardio_001',
      'type': 'Running',
      'date': DateTime.now().toIso8601String(),
      'duration': 1800, // 30 minutes in seconds
      'distance': 5.0, // km
      'calories': 300,
      'notes': 'Morning run',
    };
  }
}
