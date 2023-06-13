import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/ui/widgets/cart_screen/cart_screen_model.dart';
import 'package:test_app/ui/widgets/main_screen/categories_screen/categories_screen_model.dart';
import 'package:test_app/ui/const/constants.dart';
import '../../const/asset_icons.dart';
import '../../navigation/tab_navigator.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static Widget create() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoriesScreenModel(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CartScreenModel(),
        )
      ],
      child: const MainScreen(),
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedWidgetIndex = 0;
  String _currentWidgetKey = Constants.main;

  List<String> widgetKeys = [
    Constants.main,
    Constants.search,
    Constants.cart,
    Constants.account
  ];

  Map<String, GlobalKey<NavigatorState>> navigatorKeys = TabNavigatorKeys.keys;
  void onItemTapped(String item, int index) {
    if (index == _selectedWidgetIndex) {
      navigatorKeys[item]?.currentState?.popUntil((route) => route.isFirst);
      setState(() {});
      return;
    }
    _selectedWidgetIndex = index;
    _currentWidgetKey = widgetKeys[index];
    setState(() {});
  }

  Widget _buildOffstageNavigator(String tabItem) {
    final navigatorKey = TabNavigatorKeys.keys[tabItem];
    if (navigatorKey == null) {
      return Container();
    }
    return Offstage(
      offstage: _currentWidgetKey != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKey,
        tabItem: tabItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(Constants.main),
          _buildOffstageNavigator(Constants.search),
          _buildOffstageNavigator(Constants.cart),
          _buildOffstageNavigator(Constants.account),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetIcons.main)),
              label: Constants.main,
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetIcons.search)),
                label: Constants.search),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetIcons.cart)),
                label: Constants.cart),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetIcons.account)),
              label: Constants.account,
            ),
          ],
          currentIndex: _selectedWidgetIndex,
          onTap: ((index) => onItemTapped(widgetKeys[index], index)),
        ));
  }
}
