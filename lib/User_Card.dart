import 'package:dvm_task_2_final/constants.dart';
import 'package:flutter/material.dart';
import 'model.dart';


class UserCard extends StatefulWidget {
  UserCard({required this.user, required this.CardColor, required this.onPress});

  final User user;
  final Color CardColor;
  final Function() onPress;

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.5, horizontal: 0),
        padding: EdgeInsets.fromLTRB(21.0, 26.0, 37.0, 27.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: widget.CardColor,
            gradient: RadialGradient(
              colors: kGradientA,
              radius: 50,
              focalRadius: 50.0,
              center: Alignment.topLeft
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user.name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(widget.user.email,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFF8D848)
              ),
            ),
            SizedBox(height: 12.0),
            Text(widget.user.address.street + ' - ' +widget.user.address.suite,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
              ),
            ),
            Text(widget.user.address.city+ ' - ' + widget.user.address.zipcode,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Icon(Icons.location_on,
                  color: Colors.white,
                ),
                Text(widget.user.address.geo.lat,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),
                ),
                Expanded(child: SizedBox()),
                Icon(Icons.access_time_filled,
                  color: Colors.white,),
                Text(widget.user.address.geo.lng,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}