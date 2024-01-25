import 'dart:convert';

class Videodata {
  String productname;
  String diettype;
  String category;
  String international;
  String national;
  String productserve;
  String videoUrl;
  String? thumblineImageUrl;

  


  List<Map<String, dynamic>> ingredients;
  List<Map<String, dynamic>> steps;

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
    required this.thumblineImageUrl,



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
      'thumblineImageUrl': thumblineImageUrl,



    };
  }

  factory Videodata.fromMap(Map<String, dynamic> map) {
    return Videodata(
      productname: map['productname'] as String,
      diettype: map['diettype'] as String,
      category: map['category'] as String,
      international: map['international'] as String,
      national: map['national'] as String,
      videoUrl: map['videoUrl'] as String,
      ingredients: List<Map<String, dynamic>>.from(map['ingredients']),
      steps: List<Map<String, dynamic>>.from(map['steps']),
      productserve: map['productserve'] as String,
      thumblineImageUrl: map['thumblineImageUrl'] as String,

    );
  }
}
