import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pancingan1/akun.dart';
import './homepage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;


class AkunEdit extends StatefulWidget {
  static TextEditingController tempat = TextEditingController();
  static List list = [];
  
  @override
  _AkunEditState createState() => _AkunEditState();
}

class _AkunEditState extends State<AkunEdit> {
  TextEditingController email = TextEditingController();
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nomorHp = TextEditingController();
  
  String valLayanan = "";
  List<String> listLayanan = [];
  
  void LLayanan(String dinas) async{
    final response = await  http.post(Uri.parse("http://10.0.2.2/antriyuk/getLayanan.php"), body: {"dinas":dinas});
    List item = jsonDecode(response.body);
    for(int i =0; i<item.length; i++){
      String n = item[i]['layanan'];
      setState(() {
         listLayanan.add(n);
      });
    }
    if(listLayanan.length>0){
      valLayanan = listLayanan[0];
    }
    else{
      _showMyDialog();
    }
  }

  // void _lanjut(){
  //   ReviewAntri.nama.text = namaLengkap.text;
  //   ReviewAntri.layanan.text = valLayanan;
  //   ReviewAntri.tanggal.text = dateinput.text;
  //   ReviewAntri.tempat.text = tempat.text;
  //   HasilAntri.nama.text = namaLengkap.text;
  //   HasilAntri.layanan.text = valLayanan;
  //   HasilAntri.tempat.text = tempat.text;
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewAntri()));
  // }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Belum ada data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Maaf. Belum ada layanan yang ada'),
                Text('pada tempat yang anda pilih'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // Navigator.of(context)
                // .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HalHome()), (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }
  @override
  void initState(){ 
    super.initState();
    initializeDateFormatting('id_ID', null);

    // namaLengkap.text = user.displayName!;
    // String ndinas= AkunEdit.tempat.text;  
    // tempat.text = ndinas;
    // dateinput.text = ReviewAntri.tanggal.text;
    // LLayanan(ndinas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff56B9F5),
        leading: IconButton(
          onPressed:()=>  Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Akun()), (Route<dynamic> route) => false),
          icon: Icon(Icons.arrow_back_ios)),
        title: Text("Edit Akun"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 2,),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Detail Akun", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
          ),


          Spacer(flex: 2,),  ////////////////Nama Lengkap
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Email", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "Email anda",
                hintStyle: TextStyle(color: Colors.black87),
                border: UnderlineInputBorder(),
              ),
              controller: email,
              enabled: false,
            )
          ),

          Spacer(flex: 1,),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Nama lengkap", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "Nama lengkap anda",
                hintStyle: TextStyle(color: Colors.black87),
                border: UnderlineInputBorder(),
              ),
              controller: namaLengkap,
            )
          ),

          Spacer(flex: 1,), 
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Handphone", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "Nomor handphone anda",
                hintStyle: TextStyle(color: Colors.black87),
                border: UnderlineInputBorder(),
              ),
              controller: nomorHp,
            )
          ),

          Spacer(flex: 20,),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: -10,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(                
                onPressed: (){
                  // _lanjut();
                },
                child: Text("SELESAI", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.square(20 * 30),
                  primary: Color(0xff56B9F5)
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
