import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArView extends StatefulWidget {
  static const String routeName = "/ar-view";

  const ArView({super.key});

  @override
  State<ArView> createState() => _ArViewState();
}

class _ArViewState extends State<ArView> {
  String texturePath = "";
  ArCoreController? arCoreController;

  void arViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController?.onNodeTap = (name) => onTapHandler(name);
    arCoreController?.onPlaneTap = _handleOnPlaneTap;
  }

  onTapHandler(String name) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("onNodeTap on $name"),
      ),
    );
  }

  Future<void> _handleOnPlaneTap(List<ArCoreHitTestResult> hits) async {
    final hit = hits.first;

    final ByteData textureBytes = await rootBundle.load(texturePath);

    final earthMaterial = ArCoreMaterial(
        color: const Color.fromARGB(120, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());

    final earthShape = ArCoreSphere(
      materials: [earthMaterial],
      radius: 0.1,
    );

    final earth = ArCoreNode(
      shape: earthShape,
      children: [],
      position: hit.pose.translation + vector64.Vector3(0.0, 0.5, 0.0),
      rotation: hit.pose.rotation,
    );

    arCoreController?.addArCoreNodeWithAnchor(earth);
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    texturePath = args;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ArCoreView(
              onArCoreViewCreated: arViewCreated,
              enableTapRecognizer: true,
            ),
          ),
        ],
      ),
    );
  }
}
