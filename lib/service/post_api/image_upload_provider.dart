
import 'package:flutter/material.dart';

class ImageUploadProvider extends ChangeNotifier {
  String? _propicUrl;

  String? get propicUrl => _propicUrl;

  void setPropicUrl(String value) {
    _propicUrl = value;
    notifyListeners();
  }
}
