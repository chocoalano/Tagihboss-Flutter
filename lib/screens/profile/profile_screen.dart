import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tagihboss/components/coustom_bottom_nav_bar.dart';
import 'package:tagihboss/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/body.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int id;
  String name;
  String keyToken;
  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = json.decode(localStorage.getString('user'));
    var token = json.decode(localStorage.getString('token'));
    if (user != null) {
      print('token = ' + token);
      setState(() {
        id = user['id'];
        name = user['name'];
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile $name"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
