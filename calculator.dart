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

  print('Calculator Application');
  print('Enter the operation (+, -, *, /) or "q" to quit.');

  bool shouldQuit = false;

  while (!shouldQuit) {
    try {
      String operation = readLine('Enter the operation: ');

      if (operation == 'q') {
        shouldQuit = true;
        continue;
      } else if (!isValidOperation(operation)) {
        throw FormatException('Invalid operation. Please try again.');
      }

      double operand1 = readDouble('Enter the first operand: ');
      double operand2 = readDouble('Enter the second operand: ');

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
  }

  print('Calculator application has ended.');
}

String readLine(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()!.trim();
}

double readDouble(String prompt) {
  String input = readLine(prompt);
  return double.parse(input);
}

bool isValidOperation(String operation) {
  return ['+', '-', '*', '/'].contains(operation);
}
