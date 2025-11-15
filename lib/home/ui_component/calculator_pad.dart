import 'package:flutter/material.dart';
import 'package:trying_flutter/home/models/calculator_models.dart';

class CalculatorPad extends StatefulWidget {
  const CalculatorPad({super.key});

  @override
  State<CalculatorPad> createState() => _CalculatorPadState();
}

class _CalculatorPadState extends State<CalculatorPad> {
  String _expression = '';  // 显示完整的表达式
  String _display = '0';     // 显示当前结果
  String _currentNumber = '';
  CalculatorOperator? _operator;
  double _firstOperand = 0;
  bool _shouldResetDisplay = false;

  void _onButtonPressed(CalculatorButton button) {
    setState(() {
      switch (button.type) {
        case CalculatorButtonType.clear:
          _handleClear();
          break;
        case CalculatorButtonType.equals:
          _handleEquals();
          break;
        case CalculatorButtonType.operator:
          _handleOperator(button.operator!);
          break;
        case CalculatorButtonType.decimal:
          _handleDecimal();
          break;
        case CalculatorButtonType.number:
          _handleNumber(button.label);
          break;
      }
    });
  }

  void _handleClear() {
    _expression = '';
    _display = '0';
    _currentNumber = '';
    _operator = null;
    _firstOperand = 0;
    _shouldResetDisplay = false;
  }

  void _handleEquals() {
    if (_operator != null && _currentNumber.isNotEmpty) {
      double secondOperand = double.parse(_currentNumber);

      // 检查除零错误
      if (_operator == CalculatorOperator.divide && secondOperand == 0) {
        _expression = '错误：除以零';
        _display = '错误';
        _currentNumber = '';
        _operator = null;
        return;
      }

      double result = _operator!.calculate(_firstOperand, secondOperand);

      // 格式化结果（去除不必要的小数点）
      String resultStr;
      if (result == result.toInt()) {
        resultStr = result.toInt().toString();
      } else {
        resultStr = result.toStringAsFixed(2);
      }

      _expression = '$_expression = $resultStr';
      _display = resultStr;
      _currentNumber = resultStr;
      _operator = null;
      _shouldResetDisplay = true;
    }
  }

  void _handleOperator(CalculatorOperator operator) {
    // 如果已经有运算符且还没输入第二个数字，忽略新的运算符
    if (_operator != null && _currentNumber.isEmpty) {
      return;
    }

    if (_currentNumber.isNotEmpty) {
      if (_shouldResetDisplay) {
        // 如果刚计算完，开始新的表达式
        _expression = '$_currentNumber ${operator.symbol} ';
        _shouldResetDisplay = false;
      } else {
        // 添加运算符到表达式
        _expression = '$_expression$_currentNumber ${operator.symbol} ';
      }
      _firstOperand = double.parse(_currentNumber);
      _operator = operator;
      _currentNumber = '';
    }
  }

  void _handleDecimal() {
    if (_shouldResetDisplay) {
      _expression = '';
      _currentNumber = '0.';
      _display = '0.';
      _shouldResetDisplay = false;
    } else if (!_currentNumber.contains('.')) {
      if (_currentNumber.isEmpty) {
        _currentNumber = '0.';
      } else {
        _currentNumber += '.';
      }
      _display = _currentNumber;
    }
  }

  void _handleNumber(String number) {
    if (_shouldResetDisplay) {
      // 刚计算完，开始新的输入
      _expression = '';
      _currentNumber = number;
      _display = number;
      _shouldResetDisplay = false;
    } else {
      if (_currentNumber.isEmpty || _currentNumber == '0') {
        _currentNumber = number;
      } else {
        _currentNumber += number;
      }
      _display = _currentNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            // 显示屏区域（包含 C 按钮）
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.black87,
              child: Row(
                children: [
                  // C 按钮（清除按钮）
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CalculatorButton.clear.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _onButtonPressed(CalculatorButton.clear),
                        child: Text(
                          CalculatorButton.clear.label,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 显示屏
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 表达式显示
                          Text(
                            _expression.isEmpty ? ' ' : _expression,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // 当前数字/结果显示
                          Text(
                            _display,
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // 按钮区域
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCalculatorRow([
                    CalculatorButton.seven,
                    CalculatorButton.eight,
                    CalculatorButton.nine,
                    CalculatorButton.divide,
                  ]),
                  _buildCalculatorRow([
                    CalculatorButton.four,
                    CalculatorButton.five,
                    CalculatorButton.six,
                    CalculatorButton.multiply,
                  ]),
                  _buildCalculatorRow([
                    CalculatorButton.one,
                    CalculatorButton.two,
                    CalculatorButton.three,
                    CalculatorButton.subtract,
                  ]),
                  _buildCalculatorRow([
                    CalculatorButton.equals,
                    CalculatorButton.zero,
                    CalculatorButton.decimal,
                    CalculatorButton.add,
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculatorRow(List<CalculatorButton> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons
            .map((button) => _buildCalculatorButton(button))
            .toList(),
      ),
    );
  }

  Widget _buildCalculatorButton(CalculatorButton button) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: button.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => _onButtonPressed(button),
          child: Text(
            button.label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
