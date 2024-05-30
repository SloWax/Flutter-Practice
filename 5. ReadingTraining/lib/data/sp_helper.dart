import 'package:shared_preferences/shared_preferences.dart';
import 'performance.dart';
import 'dart:convert';
import 'dart:async';

class SPHelper {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future setCounter(int id) async {
    await prefs.setInt('counter', id);
  }

  int getCounter() {
    return prefs.getInt('counter') ?? 0;
  }

  Future writePerformance(Performance performance) async {
    prefs.setString(
        performance.id.toString(), json.encode(performance.toJson()));
  }

  List<Performance> getPerformances() {
    List<Performance> performances = [];
    Set<String> keys = prefs.getKeys();

    keys.forEach((String key) {
      if (key != 'counter') {
      Performance performance =
          Performance.fromJson(json.decode(prefs.getString(key) ?? ''));
      performances.add(performance);
      }
    });
    return performances;
  }

  Future deletePerformance(int id) async {
    prefs.remove(id.toString());
  }
}
