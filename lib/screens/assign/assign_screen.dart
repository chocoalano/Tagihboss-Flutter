import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tagihboss/components/coustom_bottom_nav_bar.dart';
import 'package:tagihboss/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/body.dart';

class Assign extends StatefulWidget {
  static String routeName = "/assign";
  @override
  _AssignScreenState createState() => _AssignScreenState();
}

class _AssignScreenState extends State<Assign> {
  int id;
  String name;
  String keyToken;
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = json.decode(localStorage.getString('user'));
    if (user != null) {
      setState(() {
        id = user['id'];
        name = user['name'];
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Assigment $name"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
