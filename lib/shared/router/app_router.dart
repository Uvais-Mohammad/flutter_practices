import 'package:aqary_test/features/auto_route_navigation/screens/first_screen.dart';
import 'package:aqary_test/features/auto_route_navigation/screens/second_screen.dart';
import 'package:aqary_test/features/home/screens.dart/home_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: FirstRoute.page, path: FirstScreen.path),
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SecondRoute.page, path: SecondScreen.path),
      ];
}
