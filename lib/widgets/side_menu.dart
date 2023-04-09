import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/responsiveness.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/side_menu_item.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  // final String itemName;
  // final VoidCallback onTap;
  const SideMenu({super.key}); // , required this.itemName, required this.onTap

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Dashhh",
                        size: 50,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          // The Column above is not visible yet because is not related to SmallScreen()
          Divider(
            color: lightGrey.withOpacity(.9),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes // sideMenuItemRoutes
                .map((item) => SideMenuItem(
                      // item
                      itemName: item.name, // item.name
                      onTap: () {
                        // Global Navigation
                        if (item.name == authenticationPageRoute) {
                          // Get.offAll(() => const AuthenticationPage());
                          menuController
                              .changeActiveTo(overviewPageDisplayName);
                          Get.offAllNamed(authenticationPageRoute);
                        }
                        // Local Navigation
                        if (!menuController.isActive(item.name)) {
                          menuController.changeActiveTo(item.name);
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Get.back();
                          }
                          navigationController.navigateTo(item.route);
                        }
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

                
                
// class SideMenu extends StatelessWidget {
//   const SideMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double _width = MediaQuery.of(context).size.width;

//     return Container(
//       color: light,
//       child: ListView(
//         children: [
//           if (ResponsiveWidget.isSmallScreen(context))
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 40),
//                 Row(
//                   children: [
//                     SizedBox(width: _width / 48),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 12),
//                       child: Image.asset("assets/icons/logo.png"),
//                     ),
//                     Flexible(
//                       child: CustomText(
//                         text: "Dashhhh",
//                         size: 20,
//                         weight: FontWeight.bold,
//                         color: active,
//                       ),
//                     ),
//                     SizedBox(width: _width / 48),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           Divider(
//             color: lightGrey.withOpacity(.1),
//           ),
//           Column(
//               mainAxisSize: MainAxisSize.min,
//               children: sideMenuItems
//                   .map((itemName) => SideMenuItem(
//                         itemName: itemName == authenticationPageRoute
//                             ? "Log Out"
//                             : itemName,
//                         onTap: () {
//                           if (itemName == authenticationPageRoute) {
//                             // TODO: go to authentification page
//                           }

//                           if (!menuController.isActive(itemName)) {
//                             menuController.changeActiveTo(itemName);
//                             if (ResponsiveWidget.isSmallScreen(context)) {
//                               Get.back();
//                             }
//                           }
//                         },
//                       ))
//                   .toList()),
//         ],
//       ),
//     );
//   }
// }
