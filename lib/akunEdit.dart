import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pancingan1/akun.dart';
import 'package:pancingan1/login.dart';
import './homepage.dart';
import 'package:http/http.dart' as http;


class AkunEdit extends StatefulWidget {
  @override
  _AkunEditState createState() => _AkunEditState();
}

class _AkunEditState extends State<AkunEdit> {
  TextEditingController email = TextEditingController();
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nomorHp = TextEditingController();
  
  void updateData () async{
    try{
    final response = await http.post(Uri.parse("http://10.0.2.2/pancingan/updateData.php"), body: {"email":email.text,"nama":namaLengkap.text,"hp":nomorHp.text});
    setState(() {
      UserDetail.hp.text = nomorHp.text;
      UserDetail.nama.text = namaLengkap.text;
      UserDetail.email.text = email.text;
    });
    _showMyDialog();
    }
    catch(err){}
    
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berhasil update data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Data yang anda masukkan berhasil diupdate'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Akun()), (Route<dynamic> route) => false);
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
    email.text = UserDetail.email.text;
    namaLengkap.text = UserDetail.nama.text;
    nomorHp.text = UserDetail.hp.text;
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
                  updateData();
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
