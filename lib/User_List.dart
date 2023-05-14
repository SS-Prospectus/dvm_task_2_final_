import 'model.dart';
import 'User_Card.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class UserList extends StatefulWidget {
  UserList({required this.maxLat});

  final double maxLat;

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late List<User> users;


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final data = jsonDecode(response.body) as List<dynamic>;
    final users = data.map((e) => User(
      id: e['id'] as int,
      name: e['name'] as String,
      username: e['username'] as String,
      email: e['email'] as String,
      address: Address(
        street: e['address']['street'] as String,
        suite: e['address']['suite'] as String,
        city: e['address']['city'] as String,
        zipcode: e['address']['zipcode'] as String,
        geo: Geo(
          lat: e['address']['geo']['lat'] as String,
          lng: e['address']['geo']['lng'] as String,
        ),
      ),
      phone: e['phone'] as String,
      website: e['website'] as String,
      company: Company(
        name: e['company']['name'] as String,
        catchPhrase: e['company']['catchPhrase'] as String,
        bs: e['company']['bs'] as String,
      ),
    )).toList();

    setState(() {
      this.users = users;
    });
  }

  @override
  Widget build(BuildContext context) {

    Color Cardcolor = kInactiveColor;
    int state =0;
    void updateCardColor() {
      setState(() {
        state = Cardcolor == kInactiveColor ? 1 : 0;
        print('Card pressed');
      });
    }

    return ListView(
        children: [
          ...users
              .where((user) =>
          double.parse(user.address.geo.lat) <= widget.maxLat)
              .map((user) => UserCard(user: user,
            CardColor: state == 0 ? kActiveColor : kInactiveColor,
            onPress: updateCardColor,
          ))
              .toList(),
        ],
      );
    
  }
}
