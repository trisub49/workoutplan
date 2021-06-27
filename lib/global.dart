import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:workoutplan/models/Food.dart';
import 'package:workoutplan/models/FoodHandler.dart';
import 'package:workoutplan/models/WeightPlan.dart';
import 'models/CalisthenicPlan.dart';
import 'models/Day.dart';
import 'models/SerialTimedPlan.dart';
import 'models/TimedPlan.dart';

List<String> dayNames = ['Hétfő', 'Kedd', 'Szerda', 'Csütörtök', 'Péntek', 'Szombat', 'Vasárnap'];
List<Day> days = [];
List<Food> foods = [];

loadAllFood() async {
  FoodHandler fh = new FoodHandler('./assets/calories/gabonatermekek.txt', 'Gabonatermékek');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/gyumolcsok.txt', 'Gyümölcsök');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/halak.txt', 'Halak');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/husok.txt', 'Húsok');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/magok.txt', 'Magok');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/sajtok.txt', 'Sajtok');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/tejtermekek.txt', 'Tejtermékek');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/tojasfelek.txt', 'Tojásfélék');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/zoldsegek.txt', 'Zöldségek');
  foods.addAll(await fh.getFoods());
  fh = new FoodHandler('./assets/calories/zsiradekok.txt', 'Zsiradékok');
  foods.addAll(await fh.getFoods());
}

navigate(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

getDayId(String dayName) {
  return dayNames.indexOf(dayName);
}

initDays() {
  days = [];
  for (var day in dayNames) {
    days.add(new Day(day, 'Ez', '17:30', '18:30',  [
      new WeightPlan('Fekvenyomás', 5, 20, 50), 
      new CalisthenicPlan('Fekvőtámasz', 6, 25),
      new TimedPlan('Futás', 30),
      new SerialTimedPlan('Plank', 5, 2)]));
  }
}


  