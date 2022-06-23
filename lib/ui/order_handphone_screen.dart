import 'package:flutter/material.dart';

class OrderHandphoneScreen extends StatefulWidget {
  const OrderHandphoneScreen({Key? key}) : super(key: key);
  @override
  OrderHpState createState() => OrderHpState();
}
class OrderHpState extends State<OrderHandphoneScreen> {
  final TextEditingController? _controllerTxtJumlah = TextEditingController();
  bool? checkInfinix10 = false;
  bool? checkPocoM4 = false;
  bool? checkSamsungA50 = false;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aplikasi Penghitung Harga",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          TextFormField(
            controller: _controllerTxtJumlah,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
            labelText: "Jumlah Total",
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                "INFINIX 10",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                  "Rp. 3.200.000",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              trailing: Checkbox(
                value: checkInfinix10,
                onChanged: (value) {
                  setState(() {
                    checkInfinix10 = value;
                  });
                },
              ),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                "POCO M4",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                  "Rp. 3.000.000",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              trailing: Checkbox(
                value: checkPocoM4,
                onChanged: (value) {
                  setState(() {
                    checkPocoM4 = value;
                  });
                },
              ),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                "SAMSUNG A50",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                  "Rp. 4.000.000",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              trailing: Checkbox(
                value: checkSamsungA50,
                onChanged: (value) {
                  setState(() {
                    checkSamsungA50 = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  try {
                    int jumlah;
                    if (_controllerTxtJumlah!.text.toString() == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Jumlah barang belum di isi")));
                    }
                    else {
                      jumlah = int.parse(_controllerTxtJumlah!.text.toString());
                      total = 0;
                      if(checkInfinix10==true){
                        total = jumlah * 3200000;
                      }if(checkPocoM4==true){
                        total = jumlah * 3000000;
                      }if(checkSamsungA50==true){
                        total = jumlah * 4000000;
                      }
                    }
                    } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString()!)));
                  }
                });
              },
              child: const Text('Hitung'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            color: Colors.green,
            child: Text(
              "TOTAL HARGA : " + total.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}