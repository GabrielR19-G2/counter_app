import 'package:flutter/material.dart';
import 'package:my_counter_app/router/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My counter app',
      routes: Routes.routes,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
