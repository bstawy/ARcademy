import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/data.dart';
import '../../models/organ_model.dart';
import '../details_screen/details_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  late List<OrganModel> searchedOrgans;

  _search(String searchQuery) {
    searchedOrgans = SystemsData.systemsOrgans.values
        .expand((list) => list)
        .where(
          (organ) =>
              organ.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              organ.system.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildSearchAppBar() {
      return Container(
        height: 40.h,
        margin: EdgeInsets.only(top: 46.5.h, left: 24.w, right: 24.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/search_icon.svg",
              colorFilter: ColorFilter.mode(
                  theme.colorScheme.secondary, BlendMode.srcIn),
              width: 18.w,
              height: 18.h,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: TextField(
                controller: _searchTextController,
                cursorColor: theme.colorScheme.secondary,
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
                decoration: InputDecoration(
                  hintText: "Find an organ...",
                  hintStyle: theme.textTheme.labelMedium!.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                ),
                scrollPadding: EdgeInsets.zero,
                onChanged: (searchedText) {
                  _search(searchedText);
                },
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.clear),
              iconSize: 18.r,
              color: theme.colorScheme.secondary,
            ),
          ],
        ),
      );
    }

    Widget? searchedItemWidget(OrganModel organ) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: [context, organ],
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          child: Text(
            "${organ.title} - ${organ.system}",
            style: theme.textTheme.labelMedium,
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildSearchAppBar(),
          _searchTextController.text.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(height: 300.h),
                      Text(
                        "Search for organs",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height - 200,
                          child: ListView.builder(
                            itemCount: searchedOrgans.length,
                            itemBuilder: (context, index) =>
                                searchedItemWidget(searchedOrgans[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
