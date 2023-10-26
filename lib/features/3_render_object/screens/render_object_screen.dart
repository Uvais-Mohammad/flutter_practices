import 'dart:math';

import 'package:aqary_test/features/3_render_object/widgets/render_custom_object.dart';
import 'package:flutter/material.dart';

class RenderObjectScreen extends StatelessWidget {
  const RenderObjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Render Object Screen'),
      ),
      body: Center(
        child: CustomBox(
          flex: 1,
          color: Colors.red,
          rotation: pi / 3,
          onTap: () {},
        ),
      ),
    );
  }
}
