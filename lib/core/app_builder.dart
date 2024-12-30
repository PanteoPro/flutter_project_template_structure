import 'package:corporative_messager/core/app.dart';
import 'package:corporative_messager/core/di/di_scope.dart';
import 'package:corporative_messager/core/di/di_scope_provider.dart';
import 'package:corporative_messager/core/di/i_di_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spargo_tools/spargo_tools.dart';

class AppBuilder implements IAppBuilder {
  late final IDiScope diScope;

  @override
  Future<Widget> build() async {
    await init();
    return Builder(builder: (context) {
      return DiScopeProvider(
        diScope: diScope,
        child: getApp(),
      );
    });
  }

  @override
  Widget getApp() {
    return const MyApp();
  }

  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    diScope = DiScope();
    await diScope.init();
  }
}
