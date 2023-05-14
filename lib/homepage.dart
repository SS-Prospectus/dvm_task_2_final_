import 'main.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Main_content.dart';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kBGcolor,
        body: Stack(
            children:[
              Positioned.fill(child: Image.asset('/Users/suryashsingh/dvm_task_2_final/assets/Background2.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              ),
              SafeArea(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:28.0, top: 28.0),
                        child: Text('Users',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      MainContent(),
                    ],
                  ),
                ),
              ),]
        ),
      ),
    );
  }
}
