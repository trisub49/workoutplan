import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:workoutplan/models/Food.dart';

class FoodHandler {

  String filename;
  String type;

  FoodHandler(this.filename, this.type);

  Future<List<Food>> getFoods() async {
    final data = await rootBundle.loadString(filename);
    try {
      List<String> lines = [];
      LineSplitter.split(data).forEach((line) { lines.add(line); });
      log('${this.type} OK');
      return _loadFoods(lines, this.type);
    } catch (err) {
      log('${err} + bazdmeg');
      return null;
    }
  }

  List<Food> _loadFoods(lines, type) {
    List<Food> actualList = [];
    for(var i = 0; i < lines.length; i ++) {
      List<String> foodData = lines[i].split(';');
      actualList.add(Food(foodData[0], double.parse(foodData[1]), double.parse(foodData[2]), double.parse(foodData[3]), double.parse(foodData[4]), type));
    }
    return actualList;
  }
}