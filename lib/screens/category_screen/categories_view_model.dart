import 'package:flutter/material.dart';

import '../../core/widgets/item_card.dart';
import '../../data/data.dart';

class CategoriesViewModel extends ChangeNotifier {
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
  final _tabs = const [
    Tab(text: 'Cardiovascular'),
    Tab(text: 'Digestive'),
    Tab(text: 'Nervous'),
    Tab(text: 'Respiratory'),
    Tab(text: 'Skeleton'),
  ];
  int _selectedItemIndex = 0;

  List<List<Widget>> get items => _items;

  List<Tab> get tabs => _tabs;

  int get selectedItemIndex => _selectedItemIndex;

  changeCurrentItemIndex(int index) {
    _selectedItemIndex = index;
    notifyListeners();
  }
}
