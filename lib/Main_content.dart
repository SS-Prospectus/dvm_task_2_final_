import 'package:dvm_task_2_final/User_List.dart';
import 'package:dvm_task_2_final/constants.dart';
import 'package:flutter/material.dart';

class MainContent extends StatefulWidget {

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  TextEditingController _value = TextEditingController();

  double lat = 90;
  late String searchtext = '';
  void clear(){
    setState(() {
      searchtext ='';
      _value.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.fromLTRB(36, 36, 36, 15),
                child: TextField(
                  controller: _value,
                  cursorColor: kLightColor,
                  style: TextStyle(
                    color: kLightColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF20180B),
                    hintText: 'Search for name...',
                    hintStyle: TextStyle(
                        color: kLightColor
                    ),
                    suffixIcon: GestureDetector(
                      onTap: clear,
                      child: Icon(Icons.cancel_outlined,
                        color: kLightColor,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search,
                      color: kLightColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Color(0xFF816F27),
                        )
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchtext = value;
                    });
                    // Perform search operation here using the entered value
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF20180B),
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 45,
                    colors: kGradientA
                  )
                ),
                margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                alignment: Alignment.center,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic ,
                      children: [
                        Text('Latitude : ',
                          style: TextStyle(
                              fontSize: 20,
                              color: kLightColor,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(lat.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF8D848)
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kLightColor,
                        thumbColor: Color (0xA1F8D848),
                        overlayColor: Color (0x33F8D848),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      child: Slider(
                          value: lat,
                          min: -200.0,
                          max: 200.0,
                          inactiveColor: Color (0xFF8D8E98),
                          onChanged: (double newValue){
                            setState(() {
                              lat = newValue;
                            });
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox(height: 3,)),
            Expanded(
              flex: 18,
              child: Container(
                  child: UserList(maxLat: lat, searchtext: searchtext,)),
            ),
          ],
        ),

      ),
    );
  }
}