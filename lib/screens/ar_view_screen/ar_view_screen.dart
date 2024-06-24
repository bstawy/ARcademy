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

  Map<int, String> organsDetails = {
    1: """The heart is a vital organ that pumps blood throughout the body, providing oxygen and nutrients to tissues and organs while removing waste products.
Chambers: Divided into four chambers - two atria and two ventricles - which receive and pump blood.\n
Valves: Ensure unidirectional blood flow within the heart.\n
Coronary Arteries: Supply oxygenated blood to the heart muscle.""",
    20: """The digestive system processes food, extracts nutrients, and eliminates waste. It includes organs such as the mouth, stomach, small intestine, and large intestine.
Mouth: Begins mechanical and chemical digestion of food.\n
Stomach: Stores and breaks down food with gastric juices.\n
Small Intestine: Absorbs nutrients from digested food.\n
Large Intestine: Absorbs water and forms feces for elimination.""",
    41: """The brain is the command center of the nervous system, responsible for processing sensory information, coordinating motor responses, and regulating basic bodily functions.
Cerebrum: Largest part of the brain, responsible for higher cognitive functions such as thinking and memory.\n
Cerebellum: Located below the cerebrum, involved in coordination and balance.\n
Brainstem: Connects the brain to the spinal cord and regulates basic functions like breathing and heartbeat.""",
  };

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
                    Visibility(
                      visible: isReady,
                      child: Positioned(
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          margin: EdgeInsets.only(top: 16.h, left: 16.w),
                          width: 50.w,
                          child: Text(
                            organsDetails[organId] ?? '',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ),
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
