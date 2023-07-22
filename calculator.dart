import 'dart:io';

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }
}

void main() {
  Calculator calculator = Calculator();
  String operation;

  print('Calculator Application');
  print('Enter the operation (+, -, *, /) or "q" to quit.');

  do {
    try {
      operation = stdin.readLineSync()!.trim();

      if (operation == 'q') {
        break;
      } else if (operation != '+' &&
          operation != '-' &&
          operation != '*' &&
          operation != '/') {
        throw FormatException('Invalid operation. Please try again.');
      }

      print('Enter the first operand:');
      double operand1 = double.parse(stdin.readLineSync()!);

      print('Enter the second operand:');
      double operand2 = double.parse(stdin.readLineSync()!);

      double result;

      switch (operation) {
        case '+':
          result = calculator.add(operand1, operand2);
          break;
        case '-':
          result = calculator.subtract(operand1, operand2);
          break;
        case '*':
          result = calculator.multiply(operand1, operand2);
          break;
        case '/':
          result = calculator.divide(operand1, operand2);
          break;
        default:
          result = 0.0;
      }

      print('Result: $result');
    } catch (e) {
      print('Error: $e');
    }

    print('Enter the next operation (+, -, *, /) or "q" to quit.');
  } while (true);

  print('Calculator application has ended.');
}
