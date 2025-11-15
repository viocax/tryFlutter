import 'package:flutter/material.dart';

// 运算符枚举
enum CalculatorOperator {
  add,
  subtract,
  multiply,
  divide;

  // 获取显示符号
  String get symbol {
    switch (this) {
      case CalculatorOperator.add:
        return '+';
      case CalculatorOperator.subtract:
        return '-';
      case CalculatorOperator.multiply:
        return 'x';
      case CalculatorOperator.divide:
        return '÷';
    }
  }

  // 执行计算
  double calculate(double first, double second) {
    switch (this) {
      case CalculatorOperator.add:
        return first + second;
      case CalculatorOperator.subtract:
        return first - second;
      case CalculatorOperator.multiply:
        return first * second;
      case CalculatorOperator.divide:
        return first / second;
    }
  }

  // 从符号字符串获取枚举
  static CalculatorOperator? fromSymbol(String symbol) {
    switch (symbol) {
      case '+':
        return CalculatorOperator.add;
      case '-':
        return CalculatorOperator.subtract;
      case 'x':
        return CalculatorOperator.multiply;
      case '÷':
        return CalculatorOperator.divide;
      default:
        return null;
    }
  }
}

// 计算器按钮类型枚举
enum CalculatorButtonType {
  number,
  operator,
  equals,
  clear,
  decimal;
}

// 计算器按钮枚举
enum CalculatorButton {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  decimal,
  add,
  subtract,
  multiply,
  divide,
  equals,
  clear;

  // 获取按钮显示文本
  String get label {
    switch (this) {
      case CalculatorButton.zero:
        return '0';
      case CalculatorButton.one:
        return '1';
      case CalculatorButton.two:
        return '2';
      case CalculatorButton.three:
        return '3';
      case CalculatorButton.four:
        return '4';
      case CalculatorButton.five:
        return '5';
      case CalculatorButton.six:
        return '6';
      case CalculatorButton.seven:
        return '7';
      case CalculatorButton.eight:
        return '8';
      case CalculatorButton.nine:
        return '9';
      case CalculatorButton.decimal:
        return '.';
      case CalculatorButton.add:
        return '+';
      case CalculatorButton.subtract:
        return '-';
      case CalculatorButton.multiply:
        return 'x';
      case CalculatorButton.divide:
        return '÷';
      case CalculatorButton.equals:
        return '=';
      case CalculatorButton.clear:
        return 'C';
    }
  }

  // 获取按钮类型
  CalculatorButtonType get type {
    switch (this) {
      case CalculatorButton.zero:
      case CalculatorButton.one:
      case CalculatorButton.two:
      case CalculatorButton.three:
      case CalculatorButton.four:
      case CalculatorButton.five:
      case CalculatorButton.six:
      case CalculatorButton.seven:
      case CalculatorButton.eight:
      case CalculatorButton.nine:
        return CalculatorButtonType.number;
      case CalculatorButton.add:
      case CalculatorButton.subtract:
      case CalculatorButton.multiply:
      case CalculatorButton.divide:
        return CalculatorButtonType.operator;
      case CalculatorButton.equals:
        return CalculatorButtonType.equals;
      case CalculatorButton.clear:
        return CalculatorButtonType.clear;
      case CalculatorButton.decimal:
        return CalculatorButtonType.decimal;
    }
  }

  // 获取按钮颜色
  Color get color {
    switch (type) {
      case CalculatorButtonType.number:
        return Colors.blue;
      case CalculatorButtonType.operator:
        return Colors.deepOrange;
      case CalculatorButtonType.equals:
        return Colors.orange;
      case CalculatorButtonType.clear:
        return Colors.red;
      case CalculatorButtonType.decimal:
        return Colors.blue;
    }
  }

  // 获取对应的运算符
  CalculatorOperator? get operator {
    switch (this) {
      case CalculatorButton.add:
        return CalculatorOperator.add;
      case CalculatorButton.subtract:
        return CalculatorOperator.subtract;
      case CalculatorButton.multiply:
        return CalculatorOperator.multiply;
      case CalculatorButton.divide:
        return CalculatorOperator.divide;
      default:
        return null;
    }
  }
}
