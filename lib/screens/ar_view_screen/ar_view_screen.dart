import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  int? organId;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var args = ModalRoute.of(context)!.settings.arguments as int;
      organId = args;
      setState(() {});
    });
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
        body: organId == 1 || organId == 20 || organId == 41
            ? PopScope(
                onPopInvoked: (willPop) async {
                  await _unityWidgetController?.unload();
                },
                child: Stack(
                  children: [
                    UnityWidget(
                      onUnityCreated: onUnityCreated,
                      fullscreen: false,
                      useAndroidViewSurface: true,
                    ),
                    Visibility(
                      visible: !isReady,
                      child: Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: SizedBox(
                          width: 200.w,
                          height: 50.h,
                          child: ElevatedButton(
                            child: const Text('Tap here to start'),
                            onPressed: () {
                              isReady = true;
                              _sendMessageToUnity('$organId');
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "Sorry, This organ will be available soon",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ));
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) async {
    _unityWidgetController = await controller;
  }

  void _sendMessageToUnity(String message) {
    try {
      _unityWidgetController?.postMessage(
        'AR Placement Interactable', // Name of the GameObject with the ARManager script
        'ReceiveMessageFromFlutter', // Method name in the ARManager script
        message, // Message to send
      );
    } catch (e) {
      debugPrint('Error sending message to Unity: $e');
    }
  }
}
