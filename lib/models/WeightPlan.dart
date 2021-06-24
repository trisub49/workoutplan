import 'Plan.dart';

class WeightPlan extends Plan {
  
  int rep;
  int serial;
  int weight;

  WeightPlan(name, serial, rep, weight) {
    super.name = name;
    this.rep = rep;
    this.serial = serial;
    this.weight = weight;
  }

  @override
  String toString() {
    return '${name} (${serial} x ${rep}, ${weight}kg)';
  }

}