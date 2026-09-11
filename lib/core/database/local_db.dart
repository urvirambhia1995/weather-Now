import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class LocalDb {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Open boxes
    await Hive.openBox(AppConstants.weatherBox);
    await Hive.openBox<String>(AppConstants.favoritesBox);
    
    prefs = await SharedPreferences.getInstance();
  }
}
