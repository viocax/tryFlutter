# Trying Flutter

A practical Flutter learning project featuring multiple utility modules.

## Features

### 📱 Main Functions

- **Calculator** - Basic calculator functionality
  - Basic operations (+, -, ×, ÷)
  - Operator input validation
  - Error handling (division by zero)

- **Color Picker** - RGB color selector
  - Real-time color preview
  - RGB value adjustment
  - Opacity control
  - Hex color code display

- **Navigation 1.0 Demo** - Comprehensive navigation examples
  - Basic Push/Pop navigation
  - Passing data between pages
  - Returning data from pages
  - Named routes with centralized management
  - 404 error handling

### 🎨 Technical Highlights

- **Bottom Tab Navigation** - Implemented with `TabBar` and `TabBarView`
- **Responsive Layout** - Adaptive design for different screen sizes
- **Component-Based Design** - Reusable widgets (e.g., `ColorSlider`)
- **Centralized Route Management** - Using `onGenerateRoute` with `RouteGenerator`
- **Type-Safe Navigation** - Parameter validation and error handling
- **Material Design** - Following Material Design guidelines

## Project Structure

```
lib/
├── main.dart                           # App entry point
├── app.dart                            # App configuration
├── home/
│   ├── home_page.dart                  # Main page (Tab navigation)
│   ├── models/
│   │   └── calculator_models.dart      # Calculator data models
│   └── ui_component/
│       └── calculator_pad.dart         # Calculator component
├── color_picker/
│   ├── color_picker_page.dart          # Color picker page
│   └── widgets/
│       └── color_slider.dart           # Color slider component
└── navigation/
    ├── route_generator.dart            # Centralized route management
    ├── nav1_page.dart                  # Navigation 1.0 demo page
    ├── named_route_demo_page.dart      # Named routes example
    └── not_found_page.dart             # 404 error page
```

## Getting Started

### Requirements

- Flutter SDK: ^3.9.2
- Dart SDK: ^3.9.2

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd trying_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

## Development Notes

### Custom Components

#### ColorSlider
A reusable color slider component that supports custom colors, ranges, and labels.

```dart
ColorSlider(
  label: 'Red',
  value: _red,
  color: Colors.red,
  max: 255.0,
  onChanged: (value) => setState(() => _red = value),
)
```

### Route Management

The app uses a centralized route management system with `RouteGenerator`:

```dart
// Adding a new route in route_generator.dart
static Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/your-route':
      return _buildRoute(
        page: const YourPage(),
        settings: settings,
      );
  }
}
```

**Benefits:**
- ✅ Centralized route configuration
- ✅ Type-safe parameter passing
- ✅ Built-in error handling (404 page)
- ✅ Easy to maintain and test

### Navigation 1.0 Patterns

The project demonstrates four common navigation patterns:

1. **Basic Push/Pop** - Simple navigation between pages
2. **Pass Data** - Send parameters to the next page
3. **Return Data** - Get results back from a page
4. **Named Routes** - Navigate using route names
5. **Error Handling** - Handle unknown routes with 404 page

### Responsive Design

The project uses `MediaQuery` and `SafeArea` to ensure proper display across different devices, with special handling for bottom navigation bar overlap issues.

## Learning Resources

- [Flutter Official Documentation](https://docs.flutter.dev/)
- [Dart Language Guide](https://dart.dev/guides)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)

## Known Issues

Currently, there are no major known issues. If you encounter any problems, please feel free to report them.

### Planned Improvements

- [ ] Add more calculator functions (scientific operations)
- [ ] Implement color palette save/load functionality
- [ ] Add unit tests
- [ ] Improve error handling

## Version History

- **1.1.0** - Navigation update
  - Added Navigation 1.0 comprehensive demo
  - Implemented centralized route management with `RouteGenerator`
  - Added 404 error handling
  - Improved code organization and modularity

- **1.0.0** - Initial release
  - Calculator functionality with operator validation
  - Color picker functionality
  - Tab navigation system
  - Reusable ColorSlider component

## License

This project is for learning and practice purposes only.

## Author

**Drake**

Created with ❤️ using Flutter
