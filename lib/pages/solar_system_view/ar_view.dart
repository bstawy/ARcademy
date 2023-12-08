import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArView extends StatefulWidget {
  const ArView({super.key});

  @override
  State<ArView> createState() => _ArViewState();
}

class _ArViewState extends State<ArView> {
  ArCoreController? arCoreController;

  void arViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController?.onNodeTap = (name) => onTapHandler(name);
    arCoreController?.onPlaneTap = _handleOnPlaneTap;
    //displayModel(arCoreController!);
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

    final moonMaterial = ArCoreMaterial(color: Colors.grey);

    final moonShape = ArCoreSphere(
      materials: [moonMaterial],
      radius: 0.03,
    );

    final moon = ArCoreNode(
      shape: moonShape,
      position: vector64.Vector3(0.2, 0, 0),
      rotation: vector64.Vector4(0, 0, 0, 0),
    );

    final ByteData textureBytes =
        await rootBundle.load('assets/textures/earth_texture.jpg');

    final earthMaterial = ArCoreMaterial(
        color: const Color.fromARGB(120, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());

    final earthShape = ArCoreSphere(
      materials: [earthMaterial],
      radius: 0.1,
    );

    final earth = ArCoreNode(
        shape: earthShape,
        children: [moon],
        position: hit.pose.translation + vector64.Vector3(0.0, 0.5, 0.0),
        //plane.pose.translation + vector64.Vector3(0.0, 1.0, 0.0),
        rotation: hit.pose.rotation);
    //plane.pose.rotation);

    arCoreController?.addArCoreNodeWithAnchor(earth);
  }

/*
  void displayModel(ArCoreController controller) async {
    final ByteData textureBytes =
        await rootBundle.load('assets/images/earth_map_texture.jpg');

    final material = ArCoreMaterial(
      color: Colors.blue,
      textureBytes: textureBytes.buffer.asUint8List(),
    );

    final sphere = ArCoreSphere(
      materials: [material],
      //radius: 0.1,
    );

    final node = ArCoreNode(
      shape: sphere,
      position: vector64.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earth Planet'),
      ),
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
