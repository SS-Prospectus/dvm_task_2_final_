import 'package:dvm_task_2_final/constants.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class splash extends StatefulWidget {

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGcolor,
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('/Users/suryashsingh/dvm_task_2_final/assets/Background2.png',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          ),
          SafeArea(
            child: Expanded(
              child: Container(
                child: Center(
                  child: Image.asset('/Users/suryashsingh/dvm_task_2_final/assets/dvm_logo.png',
                    height: 300,
                    width: 250,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
