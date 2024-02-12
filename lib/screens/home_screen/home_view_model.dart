import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../screens/home_screen/widgets/item_card.dart';

class HomeViewModel extends ChangeNotifier {
  final List<List<Widget>> _items = [
    SystemsData.systemsOrgans["Cardiovascular System"]!
        .map((organ) => ItemCard(organ: organ))
        .toList(),
    SystemsData.systemsOrgans["Digestive System"]!
        .map((organ) => ItemCard(organ: organ))
        .toList(),
    SystemsData.systemsOrgans["Nervous System"]!
        .map((organ) => ItemCard(organ: organ))
        .toList(),
    SystemsData.systemsOrgans["Respiratory System"]!
        .map((organ) => ItemCard(organ: organ))
        .toList(),
    SystemsData.systemsOrgans["Skeleton System"]!
        .map((organ) => ItemCard(organ: organ))
        .toList(),
  ];
  int _selectedSystemIndex = 0;
  int _currentItemIndex = 0;

  int get selectedSystemIndex => _selectedSystemIndex;

  int get currentItemIndex => _currentItemIndex;

  List<List<Widget>> get items => _items;

  changeSelectedSystemIndex() {
    if (_selectedSystemIndex < 4) {
      _selectedSystemIndex++;
    } else {
      _selectedSystemIndex = 0;
    }
    _currentItemIndex = 0;
    notifyListeners();
  }

  changeCurrentIemIndex(int index) {
    _currentItemIndex = index;
    notifyListeners();
  }
}
