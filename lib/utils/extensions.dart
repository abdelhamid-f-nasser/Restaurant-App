import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext {
  Size get _mediaQuerySize => MediaQuery.of(this).size;
  double get h=> _mediaQuerySize.height;
  double get w => _mediaQuerySize.width;
  CupertinoThemeData get cupertinoTheme => CupertinoTheme.of(this);
  CupertinoTextThemeData get textTheme => cupertinoTheme.textTheme;
}
