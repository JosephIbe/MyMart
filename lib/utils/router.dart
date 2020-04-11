import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:g_mart/screens/create_roles.dart';
import 'package:g_mart/screens/home.dart';
import 'package:g_mart/screens/login.dart';
import 'package:g_mart/screens/manage_users.dart';
import 'package:g_mart/screens/all_sales_reports.dart';
import 'package:g_mart/screens/products_catalog.dart';
import 'package:g_mart/screens/settings.dart';

import 'constants.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case loginRoute:
        return MaterialPageRoute(builder:  (_) => Login());
        break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case createUsersRoute:
        return MaterialPageRoute(builder: (_) => CreateUserRole());
        break;
      case manageUsersRoute:
        return MaterialPageRoute(builder: (_) => ManageUsers());
        break;
      case stockMgtRoute:
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case salesReportRoute:
        return MaterialPageRoute(builder: (_) => AllSalesReports());
        break;
      case allProductsRoute:
        var args = settings.arguments;
        return MaterialPageRoute(builder: (_) => ProductsCatalog(role: args));
        break;
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => Settings());
        break;
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route specified for ${settings.name}'),
          ),
        ));
    }
  }
}