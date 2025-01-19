import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> navigateTo<T>(Widget screen) {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Future<T?> replaceWith<T>(Widget screen) {
    return Navigator.pushReplacement<T, T>(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void goBack() {
    Navigator.pop(this);
  }

  void popUntilAndPush(Widget screen, RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void replaceAllWith(Widget screen) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }
}
