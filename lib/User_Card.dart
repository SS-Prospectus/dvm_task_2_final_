import 'package:dvm_task_2_final/constants.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserCard extends StatefulWidget {
  UserCard({required this.user});

  final User_ user;

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  CollectionReference users = FirebaseFirestore.instance.collection('friends');

  Future<void> addFriend(User_ friend) async{
    return await users.doc(friend.id.toString()).set({
      'name' : friend.name,
      'email': friend.email,
      'username': friend.username,
      'Address' : {
        'street': friend.address.street,
        'suite': friend.address.suite,
        'city': friend.address.city,
        'zipcode': friend.address.zipcode,
        'geo': {
          'lat': friend.address.geo.lat,
          'lng': friend.address.geo.lng,
        },
      },
    }).then((value) => print("Friend Added")).catchError((error) => print("Failed to add friend: $error"));
  }

  Future<void> deleteFriend(User_ friend) async{
    return await users.doc(friend.id.toString()).delete()
        .then((value) => print("Friend deleted")).catchError((error) => print("Failed to delete frind : $error"));
  }


  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.user.state;

    return GestureDetector(
      onTap: (){
        setState(() {
          widget.user.state = !widget.user.state;
        });
        if (!isSelected) {
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
            color: CardColor,
            gradient: RadialGradient(
              colors: isSelected == false ? kGradientA :kGradientB,
              radius: 20,
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