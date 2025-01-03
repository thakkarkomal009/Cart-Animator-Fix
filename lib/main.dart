import 'package:cart_animator_fix/router/router.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CarAnimatorFixApp(
    router: AppRouter(),
  ));
}

class CarAnimatorFixApp extends StatelessWidget {
  final AppRouter? router;

  const CarAnimatorFixApp({
    super.key,
    required this.router,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cart Animator Fix",
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router!.generateRoute,
    );
  }
}

class Get {
  static BuildContext? get context => navigatorKey.currentContext;

  static NavigatorState? get navigator => navigatorKey.currentState;
}
