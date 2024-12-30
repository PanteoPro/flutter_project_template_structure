import 'package:corporative_messager/core/di/i_di_scope.dart';
import 'package:flutter/material.dart';

class DiScopeProvider<T extends IDiScope> extends InheritedWidget {
  const DiScopeProvider({required this.diScope, required super.child});

  final T diScope;

  static T? of<T extends IDiScope>(BuildContext context) =>
      context.findAncestorWidgetOfExactType<DiScopeProvider<T>>()?.diScope;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
