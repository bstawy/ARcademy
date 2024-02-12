import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/web_services/firebase_utils.dart';
import '../../core/widgets/custom_sliver_app_bar_widget.dart';
import '../../layout/layout_view_model.dart';
import '../../models/organ_model.dart';
import 'widgets/favorites_item_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<OrganModel> _items = [
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

  List<OrganModel> _favorites = [];

  late ScrollController _scrollController;
  bool _isAppBarPinned = false;

  void getFavorites() async {
    List<int> favoriteItemIds = await FirebaseUtils.getFavoriteItemIds();
    debugPrint("$favoriteItemIds");

    if (favoriteItemIds.isNotEmpty) {
      for (int i = 0; i < _items.length; i++) {
        for (int j = 0; j < favoriteItemIds.length; j++) {
          if (_items[i].id == favoriteItemIds[j]) {
            var item = _items[i]..isFavorite = true;
            debugPrint(item.title);
            _favorites.add(item);
            continue;
          }
        }
      }
    }
    setState(() {});
    debugPrint("$_favorites");
  }

  @override
  initState() {
    super.initState();
    getFavorites();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarPinned =
            _scrollController.offset > 35.h; // Adjust the threshold as needed
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Expanded(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomSliverAppBarWidget(
            title: "Favorites",
            leadingOnClicked: () {
              Provider.of<LayoutViewModel>(context, listen: false)
                  .changeCurrentScreen(0);
            },
            isAppBarPinned: _isAppBarPinned,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 75.h,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            sliver: (_favorites.isNotEmpty)
                ? SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return FavoritesItemCard(organ: _favorites[index]);
                      },
                      childCount: _favorites.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 50.w / 88.h,
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 170.h,
                        ),
                        Text(
                          "No Favorites",
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 45.h,
            ),
          ),
        ],
      ),
    );
  }
}
/*StreamBuilder<DocumentSnapshot>(
              stream: FirebaseUtils.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                      child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  );
                }

                List<OrganModel> favorites = [];

                if (snapshot.hasData && snapshot.data != null) {
                  final data = snapshot.data!.data()! as Map<String, dynamic>;
                  final favoriteItemIds = data['favoriteItemIds'];
                  debugPrint(favoriteItemIds.length);

                  for (int i = 0; i < _items.length; i++) {
                    for (int j = 0; j < favoriteItemIds.length; j++) {
                      if (_items[i].id == favoriteItemIds[j].toInt()) {
                        _items[i].isFavorite = true;
                        favorites.add(_items[i]);
                        continue;
                      }
                    }
                  }
                }

                // Display favorite items using your preferred UI components
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return (favorites.isNotEmpty)
                          ? FavoritesItemCard(organ: favorites[index])
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                Text(
                                  "No Favorites",
                                  style: theme.textTheme.displayMedium,
                                ),
                              ],
                            );
                    },
                    childCount: favorites.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 50.w / 88.h,
                  ),
                );
              },
            ),*/