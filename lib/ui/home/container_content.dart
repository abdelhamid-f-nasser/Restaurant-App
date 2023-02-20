
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/ui/food_search/search_food_page.dart';
import 'package:restaurant_app/utils/router/index.dart';

class HomeContent extends StatelessWidget {
  HomeContent({
    super.key,
    required this.tabName,
  });

  final String tabName;

  int get tabPosition => _tabItems.keys.toList().indexOf(tabName);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: tabPosition,
        backgroundColor: CupertinoColors.systemBackground,
        activeColor: CupertinoColors.activeBlue,
        inactiveColor: CupertinoColors.activeBlue.withOpacity(.5),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search_circle),
            label: 'Food Items',
            activeIcon: Icon(CupertinoIcons.search_circle_fill),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Favourite',
            activeIcon: Icon(CupertinoIcons.heart_fill),
          ),
        ],
        onTap: (int index) {
          context.go('/${_tabItems.keys.toList()[index]}');
        },
      ),
      tabBuilder: (context, index) {
        return _tabItems.values.toList()[index];
      },
    );
  }

  //Todo: Add real pages
  final _tabItems = {
    MainRoutes.search.name: const SearchFoodPage(),
    MainRoutes.favourite.name: const ColoredBox(
      color: CupertinoColors.systemTeal,
    ),
  };
}
