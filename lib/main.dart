import 'package:adss_limited_mechine_test/home/controller/user_controller.dart';
import 'package:adss_limited_mechine_test/home/screens/user_list_screen.dart';
import 'package:adss_limited_mechine_test/home/screens/user_details_screen.dart';
import 'package:adss_limited_mechine_test/utils/route_name.dart';
import 'package:adss_limited_mechine_test/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserConroller(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute:onGenerateRoute,
        routes:{
            Routes.userDetailsScreen:(context) =>const UserDetailsScreen()
        } ,
        home: const BookListScreen(),
      ),
    );
  }
}
