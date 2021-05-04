import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tagihboss/components/default_button.dart';
import 'package:tagihboss/network/api.dart';

class CreateActivity extends StatelessWidget {
  final String act;
  CreateActivity({@required this.act});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Activity"),
      ),
      body: Container(
        child: BelajarForm(),
      ),
    );
  }
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  String _valKarakterDebitur;
  String _valBertemuDengan;
  String _valKonPer;
  String _valAssetDeb;
  String _valJanjiBayar;
  String _valCC;
  String _valNA;
  List<dynamic> _dataKonPer = List(),
      _dataAssetDeb = List(),
      _dataCC = List(),
      _dataNA = List();

  void getKonPer() async {
    try {
      var res = await Network().getData('/get-kondisi-pekerjaan');
      print(json.decode(res.body));
      var listData = json.decode(res.body); //lalu kita decode hasil datanya
      setState(() {
        _dataKonPer = listData; // dan kita set kedalam variable _dataProvince
      });
      print("Data Province : $listData");
    } catch (e) {
      print(e);
    }
  }

  void getNA() async {
    try {
      var res = await Network().getData('/get-next-action');
      var listData = json.decode(res.body); //lalu kita decode hasil datanya
      setState(() {
        _dataNA = listData; // dan kita set kedalam variable _dataProvince
      });
    } catch (e) {
      print(e);
    }
  }

  void getCC() async {
    try {
      var res = await Network().getData('/get-case-category');
      print(json.decode(res.body));
      var listData = json.decode(res.body); //lalu kita decode hasil datanya
      setState(() {
        _dataCC = listData; // dan kita set kedalam variable _dataProvince
      });
    } catch (e) {
      print(e);
    }
  }

  void getAsDeb() async {
    try {
      var res = await Network().getData('/get-asset-debitur');
      var listData = json.decode(res.body); //lalu kita decode hasil datanya
      setState(() {
        _dataAssetDeb = listData; // dan kita set kedalam variable _dataProvince
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKonPer();
    getAsDeb();
    getCC();
    getNA();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: 342342343",
                  labelText: "Taskcode",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Taskcode tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: 1",
                  labelText: "Kunjungan ke",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Kunjungan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: 1000000",
                  labelText: "Total Penghasilan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Total Penghasilan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: 234234576234",
                  labelText: "Invalid Numbers",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid Numbers tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Enter text here...",
                  labelText: "Keterangan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.streetAddress,
                maxLines: 8,
              ),
              SizedBox(height: 20),
              DropdownButton(
                isExpanded: true,
                isDense: true,
                hint: Text("Select Bertemu Dengan"),
                value: _valBertemuDengan,
                items: <String>[
                  'Debitur/pasangan',
                  'Keluarga',
                  'Tetangga',
                  'Orang lain'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valBertemuDengan = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton(
                isExpanded: true,
                isDense: true,
                hint: Text("Select Karakter Debitur"),
                value: _valKarakterDebitur,
                items: <String>[
                  'corporative',
                  'noncorporative',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valKarakterDebitur = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton(
                isExpanded: true,
                isDense: true,
                hint: Text("Select Kondisi Pekerjaan"),
                value: _valKonPer,
                items: _dataKonPer.map((item) {
                  return DropdownMenuItem(
                    child: Text(item['options']),
                    value: item['options'],
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valKonPer = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton(
                isExpanded: true,
                isDense: true,
                hint: Text("Select Asset Debitur"),
                value: _valAssetDeb,
                items: _dataAssetDeb.map((item) {
                  return DropdownMenuItem(
                    child: Text(item['options']),
                    value: item['options'],
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valAssetDeb = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton(
                isExpanded: true,
                isDense: true,
                hint: Text("Select Janji Bayar"),
                value: _valJanjiBayar,
                items: <String>['Ya', 'Tidak']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: (value == 'Ya') ? 'Y' : 'N',
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valJanjiBayar = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton(
                isExpanded: true,
                isDense: true,
                hint: Text("Select Case Category"),
                value: _valCC,
                items: _dataCC.map((item) {
                  return DropdownMenuItem(
                    child: Text(item['options']),
                    value: item['options'],
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valCC = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButton(
                isExpanded: true,
                isDense: true,
                hint: Text("Select Next Actions"),
                value: _valNA,
                items: _dataNA.map((item) {
                  return DropdownMenuItem(
                    child: Text(item['options']),
                    value: item['options'],
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valNA = value;
                  });
                },
              ),
              SizedBox(height: 30),
              DefaultButton(
                text: "Continue Create",
                press: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
