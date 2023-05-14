import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dvm_task_2_final/model.dart';


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
