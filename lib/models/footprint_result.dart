import 'dart:math';

class FootprintResult {
  final double value;
  final String description;
  final bool unit;

  FootprintResult({this.value, this.description, this.unit});

  static int randval(int a){
    if(a!=null){
      return a;
    }
    Random r = new Random();
    if(r.nextInt(10)>5){
      return 10;
    }
    return null;
  }

  factory FootprintResult.fromJson(Map<String, dynamic> json) {
    return FootprintResult(
      value: double.parse(json['value']),
      description: json['description'],
      unit: json['unit'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return value.toString()+" "+description.toString()+" "+unit.toString();
  }

}