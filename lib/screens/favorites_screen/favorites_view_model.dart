import 'package:ar_cademy/data/data.dart';
import 'package:flutter/material.dart';

import '../../core/web_services/firebase_utils.dart';
import '../../models/organ_model.dart';

class FavoritesViewModel extends ChangeNotifier {
  List<OrganModel> _myFavorites = [];
  bool _isLoading = true;
  bool _hasError = false;

  List<OrganModel> get myFavorites => _myFavorites;

  bool get isLoading => _isLoading;

  bool get hasError => _hasError;

  getFavorites() {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    final snapshot = FirebaseUtils.getUserData();
    snapshot.listen((querySnapshot) {
      try {
        Map<String, dynamic> data =
            querySnapshot.data()! as Map<String, dynamic>;
        List<dynamic> favoriteItemIds = data["favoriteItemIds"];

        _myFavorites.clear();
        addToMyFavorites(favoriteItemIds);

        _isLoading = false;
        notifyListeners();
      } catch (e) {
        debugPrint("$e");
        _isLoading = false;
        _hasError = true;
        notifyListeners();
      }
    });
  }

  void addToMyFavorites(List<dynamic> favoriteItemIds) {
    for (final itemId in favoriteItemIds) {
      for (final systemOrgans in SystemsData.systemsOrgans.values) {
        for (final organ in systemOrgans) {
          if (organ.id == itemId) {
            _myFavorites.add(organ..isFavorite = true);
            break;
          }
        }
      }
    }
  }
}
