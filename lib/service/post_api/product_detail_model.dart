import 'package:flutter/material.dart';

class ProductDetail {
  final dynamic id;
  final dynamic chefId;
  final dynamic text;
  final dynamic internationalCuisine;
  final dynamic nationalCuisine;
  final dynamic productCategory;
  final dynamic productServeCategory;
  final dynamic productType;

  final dynamic videoUrl;
  final dynamic description;
  final dynamic chefName;
  final dynamic chefUrl;
 final List<Step> steps;
  final List<Ingredient> ingredients;

  ProductDetail({
    required this.id,
    required this.chefId,
    required this.text,
    required this.internationalCuisine,
    required this.nationalCuisine,
    required this.productCategory,
    required this.productServeCategory,
    required this.productType,
     required this.steps,
    required this.videoUrl,
    required this.description,
    required this.chefName,
    required this.chefUrl,
    required this.ingredients,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {

 List<dynamic> stepsList = json['steps'];
    List<Step> steps = stepsList.map((i) => Step.fromJson(i)).toList();

    List<dynamic> ingredientsList = json['ingredients'];
    List<Ingredient> ingredients =
        ingredientsList.map((i) => Ingredient.fromJson(i)).toList();

    return ProductDetail(
      id: json['id'],
      chefId: json['chefId'],
      text: json['text'],
      internationalCuisine: json['internationalCuisine'],
      nationalCuisine: json['nationalCuisine'],
      productCategory: json['productCategory'],
      productServeCategory: json['productServeCategory'],
      productType: json['productType'],
        steps: steps, 
      videoUrl: json['videoUrl'], 
      description: json['description'],
      chefName: json['chefName'],
      chefUrl: json['chefUrl'],
      ingredients: ingredients,
    );
  }
}

class Ingredient {
  final dynamic name;
  final dynamic quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}




class Step {
  final dynamic stepNo;
  final dynamic stepDescription;

  Step({
    required this.stepNo,
    required this.stepDescription,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      stepNo: json['stepNo'],
      stepDescription: json['stepDescription'],
    );
  }
}