import 'dart:convert';

class Videodata {
  String productname;
  String diettype;
  String category;
  String international;
  String national;
  String productserve;
  List<Map<String, dynamic>> ingredients;

  Videodata({
    required this.productname,
    required this.diettype,
    required this.category,
    required this.international,
    required this.national,
    required this.productserve,
    required this.ingredients,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productname': productname,
      'diettype': diettype,
      'category': category,
      'international': international,
      'national': national,
      'productserve': productserve,
      'ingredients': ingredients,
    };
  }

  factory Videodata.fromMap(Map<String, dynamic> map) {
    return Videodata(
      productname: map['productname'] as String,
      diettype: map['diettype'] as String,
      category: map['category'] as String,
      international: map['international'] as String,
      national: map['national'] as String,
      ingredients: List<Map<String, dynamic>>.from(map['ingredients']), // Corrected this line
      productserve: map['productserve'] as String,
    );
  }

  toJson() {}
}


