import 'package:campus_companion/screens/HomeScreens/home_screen.dart';
import 'package:campus_companion/screens/AuthScreens/login_screen.dart';
import 'Routes_constants.dart';

class Routes {
  static final routes = {
    RoutesConstants.login: (context) =>  LoginScreen(),
    RoutesConstants.home: (context) => const HomeScreen(),
  };
}
