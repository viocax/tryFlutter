import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'app_router_delegate.dart';
import 'app_route_information_parser.dart';

/// Navigation 2.0 示範應用
/// 這個 widget 可以嵌入到 Tab 中使用
class Nav2DemoApp extends StatefulWidget {
  const Nav2DemoApp({super.key});

  @override
  State<Nav2DemoApp> createState() => _Nav2DemoAppState();
}

class _Nav2DemoAppState extends State<Nav2DemoApp> {
  late final AppState _appState;
  late final AppRouterDelegate _routerDelegate;
  late final AppRouteInformationParser _routeInformationParser;

  @override
  void initState() {
    super.initState();
    _appState = AppState();
    _routerDelegate = AppRouterDelegate(_appState);
    _routeInformationParser = AppRouteInformationParser();
  }

  @override
  void dispose() {
    _routerDelegate.dispose();
    _appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 使用 ChangeNotifierProvider 提供 AppState 給子 widgets
    return ChangeNotifierProvider.value(
      value: _appState,
      child: Router(
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
        // 注意：在 Tab 中使用時，backButtonDispatcher 會由外層的 Navigator 處理
        // 所以這裡不需要特別設定
      ),
    );
  }
}
