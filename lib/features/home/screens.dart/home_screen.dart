import 'package:aqary_test/features/2_asynchronous_generator_with_transformer/screens/counter_screen.dart';
import 'package:aqary_test/features/6_auto_route_navigation/screens/first_screen.dart';
import 'package:aqary_test/features/3_render_object/screens/render_object_screen.dart';
import 'package:aqary_test/features/1_builder_pattern/screens/product_screen.dart';
import 'package:aqary_test/features/5_retry_policy/screens/retry_screen.dart';
import 'package:aqary_test/features/4_sticky_header/screens/sticky_header_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductScreen(),
                    ),
                  );
                },
                child: const Text("1. Builder Pattern Flutter")),
            ElevatedButton(
              onPressed: () {
                Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CounterScreen()));
              },
              child: const Text(
                "2. Asynchronous generator with bloc including with transformers",
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RenderObjectScreen(),
                    ),
                  );
                },
                child: const Text("3. Render objects with custom paints")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StickyHeaderScreen(),
                    ),
                  );
                },
                child:
                    const Text("4. Bouncing sticky header with infinite list")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RetryScreen(),
                    ),
                  );
                },
                child:
                    const Text("5. Retry policy by calling an API if failed")),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed(FirstScreen.path);
              },
              child: const Text(
                "6. Navigate between screens using Navigation 2.0 (Auto Route)",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
