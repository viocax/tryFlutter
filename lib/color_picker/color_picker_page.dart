import 'package:flutter/material.dart';
import 'package:trying_flutter/color_picker/widgets/color_slider.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  double _red = 0.0;
  double _green = 0.0;
  double _blue = 0.0;
  double _opacity = 1.0;

  Color get _currentColor => Color.fromRGBO(
        _red.toInt(),
        _green.toInt(),
        _blue.toInt(),
        _opacity,
      );

  String get _hexColor {
    final r = _red.toInt().toRadixString(16).padLeft(2, '0');
    final g = _green.toInt().toRadixString(16).padLeft(2, '0');
    final b = _blue.toInt().toRadixString(16).padLeft(2, '0');
    final a = (_opacity * 255).toInt().toRadixString(16).padLeft(2, '0');
    return '#$a$r$g$b'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SafeArea(
        bottom: false, // 不要在底部应用 SafeArea，让我们自己控制
        child: Column(
          children: [
            // Color Preview
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _currentColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _hexColor,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'RGB(${_red.toInt()}, ${_green.toInt()}, ${_blue.toInt()})',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Sliders
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 16, // 加上底部安全区域和额外间距
                ),
                child: Column(
                  children: [
                    ColorSlider(
                      label: 'Red',
                      value: _red,
                      color: Colors.red,
                      onChanged: (value) => setState(() => _red = value),
                    ),
                    const SizedBox(height: 12),
                    ColorSlider(
                      label: 'Green',
                      value: _green,
                      color: Colors.green,
                      onChanged: (value) => setState(() => _green = value),
                    ),
                    const SizedBox(height: 12),
                    ColorSlider(
                      label: 'Blue',
                      value: _blue,
                      color: Colors.blue,
                      onChanged: (value) => setState(() => _blue = value),
                    ),
                    const SizedBox(height: 12),
                    ColorSlider(
                      label: 'Opacity',
                      value: _opacity,
                      color: Colors.grey,
                      max: 1.0,
                      onChanged: (value) => setState(() => _opacity = value),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
