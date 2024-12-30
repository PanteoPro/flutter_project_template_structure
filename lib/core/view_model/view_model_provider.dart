import 'package:corporative_messager/core/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

class ViewModelProvider<T extends BaseViewModel> extends InheritedWidget {
  const ViewModelProvider({required this.vm, required super.child});

  final T vm;

  static T? of<T extends BaseViewModel>(BuildContext context) =>
      context.findAncestorWidgetOfExactType<ViewModelProvider<T>>()?.vm;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
