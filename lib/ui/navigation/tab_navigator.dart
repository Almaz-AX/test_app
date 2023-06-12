import 'package:flutter/material.dart';
import 'package:test_app/ui/widgets/account_screen/account_screen.dart';
import 'package:test_app/ui/widgets/cart_screen/cart_screen.dart';
import 'package:test_app/ui/widgets/search/search.dart';

import '../const/constants.dart';
import '../widgets/main_screen/categories_screen/categories_screen.dart';

class TabNavigatorKeys {
  static final keys = {
    Constants.main: GlobalKey<NavigatorState>(),
    Constants.search: GlobalKey<NavigatorState>(),
    Constants.cart: GlobalKey<NavigatorState>(),
    Constants.account: GlobalKey<NavigatorState>(),
  };
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    if (tabItem == Constants.main) {
      child = const CategoriesScreen();
    } else if (tabItem == Constants.search) {
      child = const SearchScreen();
    } else if (tabItem == Constants.cart) {
      child = const CartScreen();
    } else if (tabItem == Constants.account) {
      child = const AccountScreen();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
