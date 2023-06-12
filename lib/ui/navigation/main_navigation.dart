
import '../widgets/main_screen/main_screen.dart';

abstract class MainNavigationRouteNames {
  static const main = 'main/';
  static const category = 'main/category';
  static const search = 'search/';
  static const cart = 'cart/';
  static const account = 'account/';
}

class MainNavigation {
  final routes = {
    MainNavigationRouteNames.main: (context) => MainScreen.create(),
  };

}

