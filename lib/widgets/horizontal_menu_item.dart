import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants/controller.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const HorizontalMenuItem(
      {super.key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              // ~~ The method bellow change an OBSERVABLE variable ~~
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? lightGrey.withOpacity(.1)
                  : Colors.transparent,
              child: Row(children: [
                Visibility(
                    visible: menuController.isHovering(itemName) ||
                        menuController.isActive(itemName),
                    maintainSize: false,
                    maintainState: true,
                    maintainAnimation: true,
                    child: Container(width: 6, height: 40, color: dark)),
                SizedBox(width: _width / 80),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: menuController.returnIconFor(itemName),
                ),
                if (!menuController.isActive(itemName))
                  Flexible(
                      child: CustomText(
                          text: itemName,
                          color: menuController.isHovering(itemName)
                              ? dark
                              : lightGrey))
                else
                  Flexible(
                      child: CustomText(
                          text: itemName,
                          color: dark,
                          size: 18,
                          weight: FontWeight.bold))
              ]),
            )));
  }
}
