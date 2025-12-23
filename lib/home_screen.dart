import 'package:calculator/widgets/build_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: .bottomRight,
              child: Column(
                children: [
                  Text(
                    '10+50',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '60',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                BuildButton(onTap: (){}, text: "7"),
                BuildButton(onTap: (){}, text: "8"),
                BuildButton(onTap: (){}, text: "9"),
                BuildButton(onTap: (){}, text: "÷", color: Colors.orange,),
              ],
            ),
            Row(
              children: [
                BuildButton(onTap: (){}, text: "4"),
                BuildButton(onTap: (){}, text: "5"),
                BuildButton(onTap: (){}, text: "6"),
                BuildButton(onTap: (){}, text: "x", color: Colors.orange,),
              ],
            ),
            Row(
              children: [
                BuildButton(onTap: (){}, text: "1"),
                BuildButton(onTap: (){}, text: "2"),
                BuildButton(onTap: (){}, text: "3"),
                BuildButton(onTap: (){}, text: "-", color: Colors.orange,),
              ],
            ),
            Row(
              children: [
                BuildButton(onTap: (){}, text: "C"),
                BuildButton(onTap: (){}, text: "0"),
                BuildButton(onTap: (){}, text: "="),
                BuildButton(onTap: (){}, text: "+", color: Colors.orange,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


