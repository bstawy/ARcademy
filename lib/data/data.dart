import 'package:flutter/material.dart';

import '../core/web_services/firebase_utils.dart';
import '../models/organ_model.dart';

// TODO: search for spinal cord and neuron in the nervous system

class SystemsData {
  static final List<OrganModel> _cardiovascularOrgans = [
    OrganModel(
      id: 00,
      title: "Cardiovascular System",
      system: "Cardiovascular System",
      isFavorite: false,
      imagePath:
          "assets/images/cardiovascular_system/cardiovascular_system.png",
    ),
    OrganModel(
      id: 01,
      title: "Heart Anatomy",
      system: "Cardiovascular System",
      isFavorite: false,
      imagePath: "assets/images/cardiovascular_system/heart.png",
    ),
    OrganModel(
      id: 02,
      title: "Arteries and Veins Anatomy",
      system: "Cardiovascular System",
      isFavorite: false,
      imagePath: "assets/images/cardiovascular_system/arteries_and_veins.png",
    ),
  ];
  static final List<OrganModel> _digestiveOrgans = [
    OrganModel(
      id: 20,
      title: "Digestive System",
      system: "Digestive System",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/digestive_system.png",
    ),
    OrganModel(
      id: 21,
      title: "Liver Anatomy",
      system: "Digestive System",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/liver.png",
    ),
    OrganModel(
      id: 22,
      title: "Stomach Anatomy",
      system: "Digestive System",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/stomach.png",
    ),
    OrganModel(
      id: 23,
      title: "Large Intestine Anatomy",
      system: "Digestive System",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/large_intestine.png",
    ),
    OrganModel(
      id: 24,
      title: "Small Intestine Anatomy",
      system: "Digestive System",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/small_intestine.png",
    ),
    OrganModel(
      id: 27,
      title: "Duodenum Anatomy",
      system: "Digestive System",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/duodenum.png",
    ),
    OrganModel(
      id: 25,
      title: "Pancreas Anatomy",
      system: "Digestive System",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/pancreas.png",
    ),
    OrganModel(
      id: 26,
      title: "Gallbladder Anatomy",
      system: "Digestive System",
      isFavorite: false,
      imagePath: "assets/images/digestive_system/gallbladder.png",
    ),
  ];
  static final List<OrganModel> _nervousOrgans = [
    OrganModel(
      id: 40,
      title: "Nervous System",
      system: "Nervous System",
      isFavorite: false,
      imagePath: "assets/images/nervous_system/nervous_system.png",
    ),
    OrganModel(
      id: 41,
      title: "Brain Anatomy",
      system: "Nervous System",
      isFavorite: false,
      imagePath: "assets/images/nervous_system/brain.png",
    ),
    OrganModel(
      id: 42,
      title: "Nervous Anatomy",
      system: "Nervous System",
      isFavorite: false,
      imagePath: "assets/images/nervous_system/nervous.png",
    ),
  ];
  static final List<OrganModel> _respiratoryOrgans = [
    OrganModel(
      id: 60,
      title: "Respiratory System",
      system: "Respiratory System",
      isFavorite: false,
      imagePath: "assets/images/respiratory_system/respiratory_system.png",
    ),
    OrganModel(
      id: 61,
      title: "Lungs Anatomy",
      system: "Respiratory System",
      isFavorite: false,
      imagePath: "assets/images/respiratory_system/lungs.png",
    ),
  ];
  static final List<OrganModel> _skeletonOrgan = [
    OrganModel(
      id: 80,
      title: "Skeleton System",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/skeleton_system.png",
    ),
    OrganModel(
      id: 81,
      title: "Skull Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/skull.png",
    ),
    OrganModel(
      id: 82,
      title: "Thoracic Cage Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/thoracic_cage.png",
    ),
    OrganModel(
      id: 83,
      title: "Spine Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/spine.png",
    ),
    OrganModel(
      id: 84,
      title: "Sacrum Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/sacrum.png",
    ),
    OrganModel(
      id: 85,
      title: "Hand Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/hand.png",
    ),
    OrganModel(
      id: 86,
      title: "Foot Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/foot.png",
    ),
    OrganModel(
      id: 87,
      title: "Leg Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/leg.png",
    ),
    OrganModel(
      id: 88,
      title: "Femur Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/femur.png",
    ),
    OrganModel(
      id: 89,
      title: "Humerus Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/humerus.png",
    ),
    OrganModel(
      id: 90,
      title: "Radios Ulna Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/radios_ulna.png",
    ),
    OrganModel(
      id: 91,
      title: "Hip Bone Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/hip_bone.png",
    ),
    OrganModel(
      id: 92,
      title: "Scapula Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/scapula.png",
    ),
    OrganModel(
      id: 93,
      title: "Patella Anatomy",
      system: "Skeleton System",
      isFavorite: false,
      imagePath: "assets/images/skeleton_system/patella.png",
    ),
  ];

  static Map<String, List<OrganModel>> systemsOrgans = {
    "Cardiovascular System": _cardiovascularOrgans,
    "Digestive System": _digestiveOrgans,
    "Nervous System": _nervousOrgans,
    "Respiratory System": _respiratoryOrgans,
    "Skeleton System": _skeletonOrgan,
  };

  static final List<OrganModel> _myFavorites = [];

  static Future<void> getData(BuildContext context) async {
    final snapshot = await FirebaseUtils.getUserData();

    snapshot.listen((querySnapshot) {
      try {
        Map<String, dynamic> data =
            querySnapshot.data()! as Map<String, dynamic>;
        List<dynamic> favoriteItemIds = data["favoriteItemIds"];

        _myFavorites.clear();
        _getFavoriteOrgans(favoriteItemIds);
        _updateOrgans();
      } catch (e) {
        debugPrint("$e");
      }
    });
  }

  static void _updateOrgans() {
    for (var systemOrgans in systemsOrgans.values) {
      for (var organ in systemOrgans) {
        organ.isFavorite =
            _myFavorites.any((favorite) => favorite.id == organ.id);
      }
    }
  }

  static void _getFavoriteOrgans(List<dynamic> favoriteItemIds) {
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
