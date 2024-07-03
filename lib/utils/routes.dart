import 'package:adss_limited_mechine_test/home/screens/user_screen.dart';
import 'package:adss_limited_mechine_test/utils/route_name.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.bookDetailsScreen:
      final args = settings.arguments as Map<String?, String?>;
      return MaterialPageRoute(
        builder: (_) => BookDetailsScreen(
          userId:args["userId"] ,
          id: args["id"],
          description: args["description"],
          title: args["title"],
        ),
      );

    default:
      final args = settings.arguments as Map<String, String>;
      return MaterialPageRoute(
          builder: (_) => BookDetailsScreen(
            userId: "",
              id: args["author"],
              description: args["description"],
              title: args["title"]));
  }
}
