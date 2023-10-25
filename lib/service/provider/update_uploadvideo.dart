import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SelectedDataModel with ChangeNotifier {
  List<int> _selectedCuisineIds = [];

  List<int> get selectedCuisineIds => _selectedCuisineIds;

  void updateSelectedData(int selectedCuisineId) {
     _selectedCuisineIds.clear();
    _selectedCuisineIds.add(selectedCuisineId);
  //  print('eewewewew$_selectedCuisineIds');
    notifyListeners();
  }
}
