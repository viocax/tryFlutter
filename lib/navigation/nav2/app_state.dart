import 'package:flutter/foundation.dart';
import 'app_route_path.dart';

/// Navigation 2.0 的應用程式狀態管理
/// 使用 ChangeNotifier 來通知 RouterDelegate 狀態變化
/// 直接使用 AppRoutePath 表示當前路由
class AppState extends ChangeNotifier {
  // 當前路徑
  AppRoutePath _currentPath = const BooksListPath();

  // Getter
  AppRoutePath get currentPath => _currentPath;

  /// 設定新的路徑（用於 URL 變化時）
  void setPath(AppRoutePath path) {
    _currentPath = path;
    notifyListeners();
  }

  /// 選擇一本書
  void selectBook(int id) {
    _currentPath = BookDetailsPath(id);
    notifyListeners();
  }

  /// 返回書籍列表
  void backToBooksList() {
    _currentPath = const BooksListPath();
    notifyListeners();
  }

  /// 顯示設定頁面
  void showSettingsPage() {
    _currentPath = const SettingsPath();
    notifyListeners();
  }

  /// 顯示 404 頁面
  void show404Page() {
    _currentPath = const UnknownPath();
    notifyListeners();
  }

  /// 返回首頁
  void goHome() {
    _currentPath = const BooksListPath();
    notifyListeners();
  }
}
