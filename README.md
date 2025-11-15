# Trying Flutter

A practical Flutter learning project featuring multiple utility modules.

## Features

### 📱 Main Functions

- **Calculator** - Basic calculator functionality
- **Color Picker** - RGB color selector
  - Real-time color preview
  - RGB value adjustment
  - Opacity control
  - Hex color code display

### 🎨 Technical Highlights

- **Bottom Tab Navigation** - Implemented with `TabBar` and `TabBarView`
- **Responsive Layout** - Adaptive design for different screen sizes
- **Component-Based Design** - Reusable widgets (e.g., `ColorSlider`)
- **Material Design** - Following Material Design guidelines

## Project Structure

```
lib/
├── main.dart                           # App entry point
├── home/
│   ├── home_page.dart                  # Main page (Tab navigation)
│   └── ui_component/
│       └── calculator_pad.dart         # Calculator component
└── color_picker/
    ├── color_picker_page.dart          # Color picker page
    └── widgets/
        └── color_slider.dart           # Color slider component
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

- **1.0.0** - Initial release
  - Calculator functionality
  - Color picker functionality
  - Tab navigation system

## License

This project is for learning and practice purposes only.

## Author

**Drake**

Created with ❤️ using Flutter
