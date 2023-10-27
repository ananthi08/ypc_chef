import 'dart:convert';

class Videodata {
  String productname;
  String diettype;
  String category;
  String international;
  String national;
  String productserve;
  String steps;
  String videoUrl;


  List<Map<String, dynamic>> ingredients;

  Videodata({
    required this.productname,
    required this.diettype,
    required this.category,
    required this.international,
    required this.national,
    required this.productserve,
    required this.ingredients,
    required this.steps,
    required this.videoUrl,


  });

  Map<String, dynamic> toJson() {
    return {
      'productname': productname,
      'diettype': diettype,
      'category': category,
      'international': international,
      'national': national,
      'productserve': productserve,
      'ingredients': ingredients,
      'steps': steps,
      'videoUrl': videoUrl,


    };
  }

  factory Videodata.fromMap(Map<String, dynamic> map) {
    return Videodata(
      productname: map['productname'] as String,
      diettype: map['diettype'] as String,
      category: map['category'] as String,
      international: map['international'] as String,
      national: map['national'] as String,
      steps: map['steps'] as String,
      videoUrl: map['videoUrl'] as String,


      ingredients: List<Map<String, dynamic>>.from(map['ingredients']),
      productserve: map['productserve'] as String,
    );
  }
}
