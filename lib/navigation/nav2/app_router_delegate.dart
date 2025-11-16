import 'package:flutter/material.dart';
import 'app_route_path.dart';
import 'app_state.dart';
import 'pages/books_list_page.dart';
import 'pages/book_details_page.dart';
import 'pages/settings_page.dart';
import 'pages/not_found_page.dart';

/// Navigation 2.0 的 RouterDelegate
/// 負責管理應用的頁面堆疊（navigation stack）
class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppState appState;

  AppRouterDelegate(this.appState) : navigatorKey = GlobalKey<NavigatorState>() {
    // 監聽 appState 的變化，當狀態改變時通知 Router 重建頁面
    appState.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appState.removeListener(notifyListeners);
    super.dispose();
  }

  /// 當前的路由配置
  /// Router 會呼叫這個 getter 來獲取當前路由狀態
  @override
  AppRoutePath get currentConfiguration {
    return appState.currentPath;
  }

  /// 設定新的路由配置
  /// 當瀏覽器的 URL 改變時，Router 會呼叫此方法
  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    appState.setPath(path);
  }

  /// 處理返回按鈕邏輯
  /// 使用 AppRoutePath 判斷當前頁面並決定返回行為
  @override
  Future<bool> popRoute() {
    // 使用 switch 根據 AppRoutePath 決定返回行為
    return switch (appState.currentPath) {
      BooksListPath() => Future.value(false), // 已經在最底層
      BookDetailsPath() || SettingsPath() || UnknownPath() => () {
        appState.backToBooksList();
        return Future.value(true);
      }(),
    };
  }

  /// 構建頁面堆疊
  /// 使用 AppRoutePath 判斷要顯示哪些頁面
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        // 第一頁：書籍列表（永遠在堆疊底部）
        const MaterialPage(
          key: ValueKey('BooksListPage'),
          child: BooksListPage(),
        ),

        // 根據 AppRoutePath 添加對應的頁面
        if (appState.currentPath case BookDetailsPath(bookId: var id))
          MaterialPage(
            key: ValueKey('BookDetailsPage-$id'),
            child: BookDetailsPage(bookId: id),
          ),

        if (appState.currentPath is SettingsPath)
          const MaterialPage(
            key: ValueKey('SettingsPage'),
            child: SettingsPage(),
          ),

        if (appState.currentPath is UnknownPath)
          const MaterialPage(
            key: ValueKey('NotFoundPage'),
            child: Nav2NotFoundPage(),
          ),
      ],
      onDidRemovePage: (page) {
        // 當頁面被移除時，更新應用狀態
        // 返回到書籍列表
        appState.backToBooksList();
      },
    );
  }
}
