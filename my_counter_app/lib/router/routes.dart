import 'package:flutter/material.dart';
import 'package:my_counter_app/screens/counter_screen.dart';

class Routes {
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const CounterScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const CounterScreen());
  }
}
