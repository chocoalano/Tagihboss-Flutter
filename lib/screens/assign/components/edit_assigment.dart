import 'package:flutter/material.dart';
import 'package:tagihboss/screens/assign/components/create_visit.dart';
import '../../../size_config.dart';
import 'create_act.dart';

class EditAssigment extends StatelessWidget {
  final Map assigment;

  EditAssigment({@required this.assigment});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Assigments"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // height: 90,
                    width: double.infinity,
                    margin: EdgeInsets.all(getProportionateScreenWidth(5)),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(20),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF4A3298),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: assigment['nama_nasabah'] + "\n",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(24),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: "No. Rekening : " +
                                  assigment['no_rekening'] +
                                  "\n"),
                          TextSpan(
                              text: "Angsuran Ke : " +
                                  assigment['ang_ke'] +
                                  "\n"),
                          TextSpan(
                              text: "Tanggal Jatuh Tempo : " +
                                  assigment['tgl_jt_tempo'] +
                                  "\n"),
                          TextSpan(
                              text: "Tenor : " + assigment['tenor'] + "\n"),
                          (assigment['status_activity'] == "0")
                              ? TextSpan(text: "Activity : Menunggu\n")
                              : TextSpan(text: "Activity : Sudah dibuat\n"),
                          (assigment['status_visit'] == "0")
                              ? TextSpan(text: "Visit : Menunggu\n")
                              : TextSpan(text: "Visit : Sudah dibuat\n"),
                          (assigment['status_payment'] == "0")
                              ? TextSpan(text: "Payment : Menunggu\n")
                              : TextSpan(text: "Payment : Sudah dibuat\n"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // height: 90,
                    width: double.infinity,
                    margin: EdgeInsets.all(getProportionateScreenWidth(5)),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(20),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF4A3298),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Alamat\n",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(24),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: assigment['alamat'] + "\n"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // height: 90,
                    width: double.infinity,
                    margin: EdgeInsets.all(getProportionateScreenWidth(5)),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(20),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF4A3298),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Detail Tagihan\n",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(24),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text:
                                  "FT. Hari : " + assigment['ft_hari'] + "\n"),
                          TextSpan(
                              text: "Baki Debet : " +
                                  assigment['baki_debet'] +
                                  "\n"),
                          TextSpan(
                              text: "Total Tunggakan : " +
                                  assigment['total_tunggakan'] +
                                  "\n"),
                          TextSpan(
                              text:
                                  "Angsuran : " + assigment['angsuran'] + "\n"),
                          TextSpan(
                              text: "Total Tagihan : " +
                                  assigment['total_tagihan'] +
                                  "\n"),
                        ],
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                      Widget>[
                    RawMaterialButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CreateActivity(act: assigment['task_code']))),
                      constraints: BoxConstraints(),
                      elevation: 2.0,
                      fillColor: Colors.deepOrange,
                      child: Icon(
                        Icons.assessment_rounded,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    Spacer(),
                    RawMaterialButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CreateVisit(visit: assigment['task_code']))),
                      constraints: BoxConstraints(),
                      elevation: 2.0,
                      fillColor: Colors.deepOrange,
                      child: Icon(
                        Icons.add_location_alt,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    Spacer(),
                    RawMaterialButton(
                      onPressed: () {},
                      constraints: BoxConstraints(),
                      elevation: 2.0,
                      fillColor: Colors.deepOrange,
                      child: Icon(
                        Icons.attach_money,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
