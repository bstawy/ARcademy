import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ArViewScreen extends StatefulWidget {
  static const String routeName = 'ar-view';
  const ArViewScreen({Key? key}) : super(key: key);

  @override
  State<ArViewScreen> createState() => _ArViewScreenState();
}

class _ArViewScreenState extends State<ArViewScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController? _unityWidgetController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unityWidgetController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: UnityWidget(
        onUnityCreated: onUnityCreated,
        onUnitySceneLoaded: onUnitySceneLoaded,
        fullscreen: false,
        useAndroidViewSurface: true,
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) async {
    _unityWidgetController = await controller;
  }

  void onUnitySceneLoaded(SceneLoaded? scene) {
    if (scene != null) {
      debugPrint('Received scene loaded from unity: ${scene.name}');
      debugPrint(
          'Received scene loaded from unity buildIndex: ${scene.buildIndex}');
    } else {
      debugPrint('Received scene loaded from unity: null');
    }
  }
}
