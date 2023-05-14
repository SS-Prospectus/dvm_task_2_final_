import 'package:dvm_task_2_final/constants.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'firebaseAD.dart';


class UserCard extends StatefulWidget {
  UserCard({required this.user});

  final User_ user;

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {


  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.user.state;

    return GestureDetector(
      onTap: (){
        setState(() {
          widget.user.state = !widget.user.state;
        });
        if (isSelected) {
          addFriend(widget.user);
        }
        else {
          deleteFriend(widget.user);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.5, horizontal: 0),
        padding: EdgeInsets.fromLTRB(21.0, 26.0, 37.0, 27.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: kInactiveColor,
            gradient: RadialGradient(
              colors: isSelected == false ? kGradientA :kGradientB,
              radius: 50,
              focalRadius: 50.0,
              center: Alignment.topLeft,
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user.name,
              style: kCardNameText,
            ),
            Text(widget.user.email,
              style: kCardEmailText,
            ),
            SizedBox(height: 12.0),
            Text(widget.user.address.street + ' - ' +widget.user.address.suite,
              style: kCardAddressText(16),
            ),
            Text(widget.user.address.city+ ' - ' + widget.user.address.zipcode,
              style: kCardAddressText(16),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Icon(Icons.location_on,
                  color: Colors.white,
                ),
                Text(widget.user.address.geo.lat,
                  style: kCardAddressText(12),
                ),
                Expanded(child: SizedBox()),
                Icon(Icons.access_time_filled,
                  color: Colors.white,),
                Text(widget.user.address.geo.lng,
                  style: kCardAddressText(12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}