import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tagihboss/network/api.dart';
import 'data_assign.dart';
import 'edit_assigment.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  Future getData() async {
    try {
      var res = await Network().getData('/assigment?page=1&q=');
      print(json.decode(res.body));
      return json.decode(res.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  // padding: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      DataAssign(
                        text: snapshot.data['data'][index]['nama_nasabah'] +
                            ' / ' +
                            snapshot.data['data'][index]['no_rekening'],
                        icon: "assets/icons/User Icon.svg",
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditAssigment(
                                    assigment: snapshot.data['data'][index]))),
                      ),
                    ],
                  ),
                );
              });
        } else {
          return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getLoadingIndicator(),
                    _getHeading(),
                    _getText('Assigment Data')
                  ]));
        }
      },
    );
  }
}

Widget _getLoadingIndicator() {
  return Padding(
      child: Container(
          child: CircularProgressIndicator(strokeWidth: 3),
          width: 32,
          height: 32),
      padding: EdgeInsets.only(bottom: 16));
}

Widget _getHeading() {
  return Padding(
      child: Text(
        'Please wait …',
        style: TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.only(bottom: 4));
}

Widget _getText(String displayedText) {
  return Text(
    displayedText,
    style: TextStyle(color: Colors.white, fontSize: 14),
    textAlign: TextAlign.center,
  );
}
