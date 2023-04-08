import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.put(NavigationController());

  // To use our local navigator we'll need to have a key that we are going to
  // asign to that particular navigator so that the app will know which
  // navigator we want to change screens for
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<dynamic>? navigateTo(String routeName) {
    return navigationKey.currentState?.pushNamed(routeName);
  }

  goBack() => navigationKey.currentState?.pop();
}
