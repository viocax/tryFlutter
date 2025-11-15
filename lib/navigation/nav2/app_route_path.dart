/// Navigation 2.0 路由路徑定義
/// 使用密封類別（sealed class）來定義所有可能的路由
/// sealed class 確保編譯器可以檢查所有分支是否都被處理
sealed class AppRoutePath {
  const AppRoutePath();
}

/// 書籍列表路徑（首頁）
class BooksListPath extends AppRoutePath {
  const BooksListPath();
}

/// 書籍詳情路徑
class BookDetailsPath extends AppRoutePath {
  final int bookId;

  const BookDetailsPath(this.bookId);
}

/// 設定頁面路徑
class SettingsPath extends AppRoutePath {
  const SettingsPath();
}

/// 未知路徑（404）
class UnknownPath extends AppRoutePath {
  const UnknownPath();
}
