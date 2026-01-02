import 'package:calculator/widgets/build_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _output = '0';
  String _input = '0';
  String _operator = '';

  double num1 = 0;
  double num2 = 0;

  // ================= CALCULATE =================
  void calculate() {
    num2 = double.parse(_input);

    switch (_operator) {
      case '+':
        num1 = num1 + num2;
        break;
      case '-':
        num1 = num1 - num2;
        break;
      case 'x':
        num1 = num1 * num2;
        break;
      case '÷':
        if (num2 != 0) {
          num1 = num1 / num2;
        } else {
          _output = 'Division Error';
          _resetAfterError();
          return;
        }
    }

    _output = _formatResult(num1);
  }

  // ================= BUTTON HANDLER =================
  void onBtnPress(String value) {
    setState(() {
      // AC / C
      if (value == 'AC' || value == 'C') {
        _resetAll();
        return;
      }

      // +/-
      if (value == '+/-') {
        if (_input.startsWith('-')) {
          _input = _input.substring(1);
        } else if (_input != '0') {
          _input = '-$_input';
        }
        _output = _input;
        return;
      }

      // %
      if (value == '%') {
        _input = (double.parse(_input) / 100).toString();
        _output = _formatResult(double.parse(_input));
        return;
      }

      // Decimal
      if (value == '.') {
        if (!_input.contains('.')) {
          _input += '.';
        }
        _output = _input;
        return;
      }

      // Operators
      if (['+', '-', 'x', '÷'].contains(value)) {
        if (_operator.isNotEmpty) {
          calculate();
        } else {
          num1 = double.parse(_input);
        }

        _operator = value;
        _input = '0';
        return;
      }

      // Equal
      if (value == '=') {
        if (_operator.isNotEmpty) {
          calculate();
          _operator = '';
          _input = _output == 'Division Error' ? '0' : _output;
        }
        return;
      }

      // Numbers
      if (_input == '0') {
        _input = value;
      } else {
        _input += value;
      }

      _output = _input;
    });
  }

  // ================= HELPERS =================
  void _resetAll() {
    _output = '0';
    _input = '0';
    _operator = '';
    num1 = 0;
    num2 = 0;
  }

  void _resetAfterError() {
    _input = '0';
    _operator = '';
    num1 = 0;
    num2 = 0;
  }

  String _formatResult(double value) {
    return value % 1 == 0 ? value.toInt().toString() : value.toString();
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _operator.isEmpty ? '' : '$num1 $_operator',
                    style: const TextStyle(color: Colors.white54, fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _output,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Row(
              children: [
                BuildButton(text: 'AC', onTap: () => onBtnPress('AC')),
                BuildButton(text: '+/-', onTap: () => onBtnPress('+/-')),
                BuildButton(text: '%', onTap: () => onBtnPress('%')),
                BuildButton(
                  text: '÷',
                  color: Colors.orange,
                  onTap: () => onBtnPress('÷'),
                ),
              ],
            ),
            Row(
              children: [
                BuildButton(text: '7', onTap: () => onBtnPress('7')),
                BuildButton(text: '8', onTap: () => onBtnPress('8')),
                BuildButton(text: '9', onTap: () => onBtnPress('9')),
                BuildButton(
                  text: 'x',
                  color: Colors.orange,
                  onTap: () => onBtnPress('x'),
                ),
              ],
            ),
            Row(
              children: [
                BuildButton(text: '4', onTap: () => onBtnPress('4')),
                BuildButton(text: '5', onTap: () => onBtnPress('5')),
                BuildButton(text: '6', onTap: () => onBtnPress('6')),
                BuildButton(
                  text: '-',
                  color: Colors.orange,
                  onTap: () => onBtnPress('-'),
                ),
              ],
            ),
            Row(
              children: [
                BuildButton(text: '1', onTap: () => onBtnPress('1')),
                BuildButton(text: '2', onTap: () => onBtnPress('2')),
                BuildButton(text: '3', onTap: () => onBtnPress('3')),
                BuildButton(
                  text: '+',
                  color: Colors.orange,
                  onTap: () => onBtnPress('+'),
                ),
              ],
            ),
            Row(
              children: [
                BuildButton(text: '0', flex: 2, onTap: () => onBtnPress('0')),
                BuildButton(text: '.', onTap: () => onBtnPress('.')),
                BuildButton(
                  text: '=',
                  color: Colors.orange,
                  onTap: () => onBtnPress('='),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
