import 'package:flutter/material.dart';
import 'app_route_path.dart';

/// Navigation 2.0 的 RouteInformationParser
/// 負責解析 URL 並轉換為 AppRoutePath
/// 也負責將 AppRoutePath 轉換回 RouteInformation（用於更新瀏覽器 URL）
class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {

  /// 將 RouteInformation（包含 URL）解析為 AppRoutePath
  /// 這個方法在應用啟動或瀏覽器 URL 改變時被呼叫
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    // 處理根路徑或空路徑
    if (uri.pathSegments.isEmpty) {
      return const BooksListPath();
    }

    // 處理 /books
    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'books') {
        return const BooksListPath();
      }
      if (uri.pathSegments[0] == 'settings') {
        return const SettingsPath();
      }
    }

    // 處理 /books/:id
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'books') {
        final id = int.tryParse(uri.pathSegments[1]);
        if (id != null) {
          return BookDetailsPath(id);
        }
      }
    }

    // 無法解析的路徑返回 404
    return const UnknownPath();
  }

  /// 將 AppRoutePath 還原為 RouteInformation
  /// 這個方法用於更新瀏覽器的 URL
  @override
  RouteInformation? restoreRouteInformation(AppRoutePath path) {
    if (path is BooksListPath) {
      return RouteInformation(uri: Uri.parse('/books'));
    }
    if (path is BookDetailsPath) {
      return RouteInformation(uri: Uri.parse('/books/${path.bookId}'));
    }
    if (path is SettingsPath) {
      return RouteInformation(uri: Uri.parse('/settings'));
    }
    if (path is UnknownPath) {
      return RouteInformation(uri: Uri.parse('/404'));
    }
    return null;
  }
}
