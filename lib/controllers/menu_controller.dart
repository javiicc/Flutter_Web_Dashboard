import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  // Instance that will allow us to access the value of the MenuController
  // from anywhere inside of our code
  // static MenuController instance = Get.find();
  static MenuController instance = Get.put(MenuController());
  // static MenuController? instance;

  // Observable properties
  // The default active item is the Overview page
  var activeItem = overviewPageDisplayName.obs;
  var hoverItem = "".obs;

  // static MenuController instance = Get.put(MenuController());

  changeActiveTo(String itemName) {
    // ~~ Changes and OBSERVABLE variable ~~_
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    // ~~ Changes and OBSERVABLE variable ~~
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  // Checks if itemName is the activeItem
  isActive(String itemName) => activeItem.value == itemName;
  // Checks if itemName is the item that is being hovered over
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case driversPageDisplayName:
        return _customIcon(Icons.drive_eta, itemName);
      case clientsPageDisplayName:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      // case logOutPageRoute:
      //   return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey);
  }
}
