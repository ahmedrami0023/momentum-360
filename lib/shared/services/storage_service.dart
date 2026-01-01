import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';

/// Local storage service using SharedPreferences
/// Provides CRUD operations for all models with JSON serialization
/// Easy migration path to Firebase later
class StorageService {
  StorageService._();
  
  static final StorageService instance = StorageService._();
  
  SharedPreferences? _prefs;

  /// Initialize the storage service
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception('StorageService not initialized. Call init() first.');
    }
    return _prefs!;
  }

  // ========== Generic Methods ==========

  /// Save a JSON-serializable object
  Future<bool> saveObject(String key, Map<String, dynamic> data) async {
    final jsonString = jsonEncode(data);
    return await prefs.setString(key, jsonString);
  }

  /// Get a JSON object
  Map<String, dynamic>? getObject(String key) {
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  /// Save a list of JSON objects
  Future<bool> saveList(String key, List<Map<String, dynamic>> list) async {
    final jsonString = jsonEncode(list);
    return await prefs.setString(key, jsonString);
  }

  /// Get a list of JSON objects
  List<Map<String, dynamic>> getList(String key) {
    final jsonString = prefs.getString(key);
    if (jsonString == null) return [];
    final list = jsonDecode(jsonString) as List;
    return list.map((item) => item as Map<String, dynamic>).toList();
  }

  /// Delete a key
  Future<bool> delete(String key) async {
    return await prefs.remove(key);
  }

  /// Clear all data
  Future<bool> clearAll() async {
    return await prefs.clear();
  }

  // ========== User Methods ==========

  Future<bool> saveUser(Map<String, dynamic> user) async {
    return await saveObject(AppConstants.keyUser, user);
  }

  Map<String, dynamic>? getUser() {
    return getObject(AppConstants.keyUser);
  }

  Future<bool> deleteUser() async {
    return await delete(AppConstants.keyUser);
  }

  // ========== Workout Methods ==========

  Future<bool> saveWorkouts(List<Map<String, dynamic>> workouts) async {
    return await saveList(AppConstants.keyWorkouts, workouts);
  }

  List<Map<String, dynamic>> getWorkouts() {
    return getList(AppConstants.keyWorkouts);
  }

  Future<bool> addWorkout(Map<String, dynamic> workout) async {
    final workouts = getWorkouts();
    workouts.add(workout);
    return await saveWorkouts(workouts);
  }

  Future<bool> updateWorkout(String workoutId, Map<String, dynamic> workout) async {
    final workouts = getWorkouts();
    final index = workouts.indexWhere((w) => w['id'] == workoutId);
    if (index != -1) {
      workouts[index] = workout;
      return await saveWorkouts(workouts);
    }
    return false;
  }

  Future<bool> deleteWorkout(String workoutId) async {
    final workouts = getWorkouts();
    workouts.removeWhere((w) => w['id'] == workoutId);
    return await saveWorkouts(workouts);
  }

  // ========== Meal Methods ==========

  Future<bool> saveMeals(List<Map<String, dynamic>> meals) async {
    return await saveList(AppConstants.keyMeals, meals);
  }

  List<Map<String, dynamic>> getMeals() {
    return getList(AppConstants.keyMeals);
  }

  Future<bool> addMeal(Map<String, dynamic> meal) async {
    final meals = getMeals();
    meals.add(meal);
    return await saveMeals(meals);
  }

  Future<bool> deleteMeal(String mealId) async {
    final meals = getMeals();
    meals.removeWhere((m) => m['id'] == mealId);
    return await saveMeals(meals);
  }

  // ========== Exercise Library Methods ==========

  Future<bool> saveExercises(List<Map<String, dynamic>> exercises) async {
    return await saveList(AppConstants.keyExercises, exercises);
  }

  List<Map<String, dynamic>> getExercises() {
    return getList(AppConstants.keyExercises);
  }

  Future<bool> addExercise(Map<String, dynamic> exercise) async {
    final exercises = getExercises();
    exercises.add(exercise);
    return await saveExercises(exercises);
  }

  // ========== Body Measurements Methods ==========

  Future<bool> saveBodyMeasurements(List<Map<String, dynamic>> measurements) async {
    return await saveList(AppConstants.keyBodyMeasurements, measurements);
  }

  List<Map<String, dynamic>> getBodyMeasurements() {
    return getList(AppConstants.keyBodyMeasurements);
  }

  Future<bool> addBodyMeasurement(Map<String, dynamic> measurement) async {
    final measurements = getBodyMeasurements();
    measurements.add(measurement);
    return await saveBodyMeasurements(measurements);
  }

  // ========== Personal Records Methods ==========

  Future<bool> savePersonalRecords(List<Map<String, dynamic>> records) async {
    return await saveList(AppConstants.keyPersonalRecords, records);
  }

  List<Map<String, dynamic>> getPersonalRecords() {
    return getList(AppConstants.keyPersonalRecords);
  }

  Future<bool> updatePersonalRecord(Map<String, dynamic> record) async {
    final records = getPersonalRecords();
    final exerciseId = record['exerciseId'];
    final index = records.indexWhere((r) => r['exerciseId'] == exerciseId);
    
    if (index != -1) {
      records[index] = record;
    } else {
      records.add(record);
    }
    
    return await savePersonalRecords(records);
  }

  // ========== Cardio Sessions Methods ==========

  Future<bool> saveCardioSessions(List<Map<String, dynamic>> sessions) async {
    return await saveList(AppConstants.keyCardioSessions, sessions);
  }

  List<Map<String, dynamic>> getCardioSessions() {
    return getList(AppConstants.keyCardioSessions);
  }

  Future<bool> addCardioSession(Map<String, dynamic> session) async {
    final sessions = getCardioSessions();
    sessions.add(session);
    return await saveCardioSessions(sessions);
  }

  // ========== Nutrition Goals Methods ==========

  Future<bool> saveNutritionGoals(Map<String, dynamic> goals) async {
    return await saveObject(AppConstants.keyNutritionGoals, goals);
  }

  Map<String, dynamic>? getNutritionGoals() {
    return getObject(AppConstants.keyNutritionGoals);
  }

  // ========== Settings Methods ==========

  Future<bool> saveSetting(String key, dynamic value) async {
    if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is double) {
      return await prefs.setDouble(key, value);
    } else if (value is bool) {
      return await prefs.setBool(key, value);
    }
    return false;
  }

  T? getSetting<T>(String key) {
    return prefs.get(key) as T?;
  }
}

