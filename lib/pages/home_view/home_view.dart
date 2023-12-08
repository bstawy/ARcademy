import 'package:flutter/material.dart';

import 'human_anatomy_widget.dart';
import 'solar_system_widget.dart';
import 'widgets/custom_app_bar_widget.dart';
import 'widgets/custom_search_widget.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/home";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedViewIndex = 0;

  List<Widget> views = const [
    HumanAnatomyWidget(),
    SolarSystemWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: CustomAppBarWidget(),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // application slogan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Text(
                    "See Beyond The Textbooks",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // search bar
              const CustomSearchWidget(),
              // category view
              views[selectedViewIndex],
              // next button
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 24.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 138,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      selectedViewIndex =
                          (selectedViewIndex + 1) % views.length;
                      setState(() {});
                    },
                    height: 74,
                    enableFeedback: true,
                    elevation: 0,
                    color: const Color(0xffBBF6E2),
                    hoverColor: const Color(0xff112331),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: selectedViewIndex == 1,
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                        Visibility(
                          visible: selectedViewIndex == 0,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 70,
                            ),
                            child: Text(
                              "Solar System",
                              maxLines: 2,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: selectedViewIndex == 1,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 80,
                            ),
                            child: Text(
                              "Human Anatomy",
                              maxLines: 2,
                              style: theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 15),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: selectedViewIndex == 0,
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 135,
            //right: -84,
            right: (selectedViewIndex == 0) ? -84 : -50,
            child: SizedBox(
              width: 305,
              height: (selectedViewIndex == 0) ? 793 : 530,
              // width: 305,
              // height: 793,
              child: Image.asset(
                (selectedViewIndex == 0)
                    ? "assets/images/human_anatomy.png"
                    : "assets/images/solar_system.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
