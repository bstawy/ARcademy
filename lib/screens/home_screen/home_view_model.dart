import 'package:ar_cademy/core/widgets/item_card.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../models/organ_model.dart';

class HomeViewModel extends ChangeNotifier {
  late List<Widget> _items;

  HomeViewModel() {
    _items = _organs
        .map((organ) => ItemCard(
              organ: organ!,
            ))
        .toList();
    _items.shuffle();
  }

  final List<OrganModel?> _organs = [
    SystemsData.systemsOrgans["Cardiovascular System"]?[0],
    SystemsData.systemsOrgans["Cardiovascular System"]?[1],
    SystemsData.systemsOrgans["Digestive System"]?[0],
    SystemsData.systemsOrgans["Digestive System"]?[2],
    SystemsData.systemsOrgans["Digestive System"]?[4],
    SystemsData.systemsOrgans["Nervous System"]?[1],
    SystemsData.systemsOrgans["Respiratory System"]?[1],
    SystemsData.systemsOrgans["Skeleton System"]?[1],
    SystemsData.systemsOrgans["Skeleton System"]?[2],
    SystemsData.systemsOrgans["Skeleton System"]?[5],
    SystemsData.systemsOrgans["Skeleton System"]?[10],
    SystemsData.systemsOrgans["Skeleton System"]?[8],
  ];

  int _currentItemIndex = 0;

  int get currentItemIndex => _currentItemIndex;

  List<Widget> get items => _items;

  changeCurrentIemIndex(int index) {
    _currentItemIndex = index;
    notifyListeners();
  }
}
