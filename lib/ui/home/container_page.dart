import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/ui/home/container_content.dart';
import 'package:restaurant_app/utils/router/index.dart';

/// Carries Tab bar and holds various pages along with NavigationBar
///
/// [tabName] is the name of the current tabBar Page
class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key, required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(tabName),
        trailing: CupertinoButton(onPressed: ()=> _onCardPressed(context), child: const Icon(CupertinoIcons.cart)),
      ),
      //Todo: Wrap widget with Providers
      child: HomeContent(
        tabName: tabName,
      ),
    );
  }


  void _onCardPressed(BuildContext context) {
    context.pushNamed(MainRoutes.cart.name);
  }
}
