import 'package:flutter/material.dart';
import 'package:trying_flutter/navigation/named_route_demo_page.dart';
import 'package:trying_flutter/navigation/not_found_page.dart';

/// 统一管理应用的路由生成
class RouteGenerator {
  /// 生成路由
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // 根据路由名称分发
    switch (settings.name) {
      case '/named-route-demo':
        return _buildRoute(
          page: const NamedRouteDemoPage(),
          settings: settings,
        );

      // 可以添加更多路由
      // case '/user-profile':
      //   // 验证参数类型
      //   if (settings.arguments is! UserProfileArguments) {
      //     return _errorRoute('Invalid arguments for user profile');
      //   }
      //   final args = settings.arguments as UserProfileArguments;
      //   return _buildRoute(
      //     page: UserProfilePage(
      //       userId: args.userId,
      //       userName: args.userName,
      //     ),
      //     settings: settings,
      //   );

      default:
        // 未找到路由，返回 null（会触发 onUnknownRoute）
        return null;
    }
  }

  /// 处理未知路由（404）
  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return _buildRoute(
      page: NotFoundPage(routeName: settings.name),
      settings: settings,
    );
  }

  /// 构建标准路由
  static MaterialPageRoute _buildRoute({
    required Widget page,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  }

  /// 构建错误路由（可选）
  static MaterialPageRoute _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 80, color: Colors.red),
                const SizedBox(height: 20),
                Text(
                  message,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // 返回主页
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
