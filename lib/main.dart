import 'package:flutter/material.dart';
import 'Main_content.dart';


void main() => runApp(Homepage());

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF03040A),
        body: Stack(
            children:[
              Positioned.fill(child: Image.asset('/Users/suryashsingh/dvm_task_2_final/assets/img.png',
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
                        margin: EdgeInsets.only(left:28.0, top: 38.0),
                        child: Text('Users',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
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
