import 'package:dvm_task_2_final/constants.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class splash extends StatefulWidget {

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with TickerProviderStateMixin {

  double opacityLevel = 1.0;

  @override
  void initState() {
    super.initState();
    _navigatehome();
    _changeacity();
  }

  void _changeacity(){
    setState(() {
      opacityLevel = 0.0;
    });
    Tween<double> _opacityTween = Tween<double>(begin: 0.0, end: 1.0);
    AnimationController _opacityController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    Animation<double> _opacityAnimation = _opacityTween.animate(_opacityController);
    _opacityAnimation.addListener(() {
      setState(() {
        opacityLevel = _opacityAnimation.value;
      });
    });
    _opacityController.forward();
  }


  _navigatehome() async {
    await Future.delayed(Duration(milliseconds: 2500),(){});
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
                  child: AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: const Duration(milliseconds: 1500),
                    child: Image.asset('/Users/suryashsingh/dvm_task_2_final/assets/dvm_logo.png',
                      height: 300,
                      width: 250,
                    ),
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
