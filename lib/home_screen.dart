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

  @override
  Widget build(BuildContext context) {


    void onBtnPress(String value) {

      setState(() {
        print('Pressed Button $value');

        if (value == "C") {
          _output = '0';
          _input = '0';
          _operator = '';
          num1 = 0;
          num2 = 0;
        } else if (value == "=") {
          num2 = double.parse(_input);

          if (_operator == "+") {
            _output = (num1 + num2).toString();
          } else if (_operator == '-') {
            _output = (num1 - num2).toString();
          } else if (_operator == "x") {
            _output = (num1 * num2).toString();
          } else if (_operator == '÷') {
            _output = (num2 != 0) ? (num1 / num2).toString() : 'Division Error';
          }

          _input = _output;
        } else if (['+', '-', 'x', '÷'].contains(value)) {
          num1 = double.parse(_input);
          _operator = value;
          _input = '0';
        } else {
          if(_input == '0'){
            _input = value;
          }else{
            _input += value;
          }
          _output = _input;

        }
      });
    }


    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: .bottomRight,
              child: Column(
                children: [
                  Text(
                    '$num1 $_operator $num2',
                    style: TextStyle(color: Colors.white54, fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _output,
                    style: TextStyle(
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
                BuildButton(onTap: ()=> onBtnPress('7'), text: "7"),
                BuildButton(onTap: ()=> onBtnPress('8'), text: "8"),
                BuildButton(onTap: ()=> onBtnPress('9'), text: "9"),
                BuildButton(onTap: ()=> onBtnPress('÷'), text: "÷", color: Colors.orange,),
              ],
            ),
            Row(
              children: [
                BuildButton(onTap: ()=> onBtnPress('4'), text: "4"),
                BuildButton(onTap: ()=> onBtnPress('5'), text: "5"),
                BuildButton(onTap: ()=> onBtnPress('6'), text: "6"),
                BuildButton(onTap: ()=> onBtnPress('x'), text: "x", color: Colors.orange,),
              ],
            ),
            Row(
              children: [
                BuildButton(onTap: ()=> onBtnPress('1'), text: "1"),
                BuildButton(onTap: ()=> onBtnPress('2'), text: "2"),
                BuildButton(onTap: ()=> onBtnPress('3'), text: "3"),
                BuildButton(onTap: ()=> onBtnPress('-'), text: "-", color: Colors.orange,),
              ],
            ),
            Row(
              children: [
                BuildButton(onTap: ()=> onBtnPress('C'), text: "C"),
                BuildButton(onTap: ()=> onBtnPress('0'), text: "0"),
                BuildButton(onTap: ()=> onBtnPress('='), text: "="),
                BuildButton(onTap: ()=> onBtnPress('+'), text: "+", color: Colors.orange,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


