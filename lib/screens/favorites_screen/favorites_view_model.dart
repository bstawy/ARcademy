import 'package:ar_cademy/core/manager/app_provider.dart';
import 'package:flutter/material.dart';

import '../../core/web_services/firebase_utils.dart';
import '../../data/data.dart';
import '../../models/organ_model.dart';

class FavoritesViewModel extends ChangeNotifier {
  final List<OrganModel> _myFavorites = [];
  bool _isLoading = true;
  bool _hasError = false;

  List<OrganModel> get myFavorites => _myFavorites;

  bool get isLoading => _isLoading;

  bool get hasError => _hasError;

  Future<void> getFavorites() async {
    if (AppProvider.user != null && AppProvider.userId != "null") {
      _isLoading = true;
      _hasError = false;
      notifyListeners();

      final snapshot = await FirebaseUtils.getUserData();
      snapshot.listen((querySnapshot) {
        try {
          Map<String, dynamic> data =
          querySnapshot.data()! as Map<String, dynamic>;
          List<dynamic> favoriteItemIds = data["favoriteItemIds"];

          _myFavorites.clear();
          _addToMyFavorites(favoriteItemIds);

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

  }

  void _addToMyFavorites(List<dynamic> favoriteItemIds) {
    if (AppProvider.user != null && AppProvider.userId != "null") {
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

  void addToFavorites(OrganModel organ) {
    if (AppProvider.user != null && AppProvider.userId != "null") {
      FirebaseUtils.addToFavorites(itemId: organ.id);
      notifyListeners();
    }
  }

  void deleteFromFavorites(OrganModel organ) {
    if (AppProvider.user != null && AppProvider.userId != "null") {
      FirebaseUtils.deleteFromFavorites(itemId: organ.id);
      notifyListeners();
    }
  }
}
