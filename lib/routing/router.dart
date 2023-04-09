import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/pages/clients/clients.dart';
import 'package:flutter_web_dashboard/pages/drivers/drivers.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Returns a page route
  switch (settings.name) {
    // case rootRoute:
    //   return _getPageRoute(const OverviewPage());
    case overviewPageRoute:
      // case overviewPageDisplayName:
      return _getPageRoute(const OverviewPage());
    case driversPageRoute:
      return _getPageRoute(const DriversPage());
    case clientsPageRoute:
      return _getPageRoute(const ClientsPage());
    case authenticationPageRoute:
      return _getPageRoute(const AuthenticationPage());
    // case logOutPageRoute:
    //   return _getPageRoute(const OverviewPage());
    default:
      return _getPageRoute(const OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
