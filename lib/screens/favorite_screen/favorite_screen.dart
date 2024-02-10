import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/manager/app_provider.dart';
import '../../core/web_services/firebase_utils.dart';
import '../../core/widgets/custom_sliver_app_bar_widget.dart';
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
  ];

  late ScrollController _scrollController;
  bool _isAppBarPinned = false;

  @override
  void initState() {
    super.initState();
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
    var provider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);

    return Expanded(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomSliverAppBarWidget(
            title: "Favorites",
            leadingOnClicked: () {
              provider.changeCurrentScreen(0);
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
            sliver: StreamBuilder<DocumentSnapshot>(
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
                  print(favoriteItemIds.length);

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
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30.h,
            ),
          ),
        ],
      ),
    );
  }
}
