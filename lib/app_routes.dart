import 'package:flutter/material.dart';
import 'package:yoga_student/login.dart';



class AppRoutes {
  static const String login = '/login';




  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginPage(),


  };
}
