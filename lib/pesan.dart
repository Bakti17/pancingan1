import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;
import 'package:pancingan1/homepage.dart';
import 'package:pancingan1/login.dart';
import 'package:pancingan1/transaksi.dart';


class Pesan extends StatefulWidget {
  static String tempat="";
  
  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  TextEditingController email = TextEditingController();
  TextEditingController tempat = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  DateTime? tgl;
  String? duduk;
  

  void getNomer() async{
    int nomor =0;
    String tanggal = DateFormat("y-MM-d", "id_ID").format(tgl!);
    final response = await http.post(Uri.parse("http://10.0.2.2/pancingan/cekKuota.php"), body: {"tempat": tempat.text});
    List kuota= jsonDecode(response.body);
    
    final res = await http.post(Uri.parse("http://10.0.2.2/pancingan/getNomer.php"), body: {"tempat": tempat.text, "tanggal":tanggal});
    List list= jsonDecode(res.body);
    int limit = kuota[0]['kuota'];
    
    var arr = {};
    for (int i = 0; i<list.length;i++){
      arr[i] = int.parse(list[i]['nomer']);
    }

    if(list.length==kuota[0]['kuota']){
     _showMyDialog();
    }
    else{
      bool lost = true;
      for(int i= 1; i<=list.length;i++){
        // print(arr[i]);
        if( i < arr[i-1] || i > arr[i-1]){
          lost = false;
          nomor = i;
          break;
        }
      }
      if(lost){
        nomor = arr.length + 1;
      }
    }
    String n = nomor.toString();
    print(n);
    inserData(n, tanggal);
  }

  void inserData(String no, String tanggal) async{
    print(no);
    try{
      final response = await http.post(Uri.parse("http://10.0.2.2/pancingan/insertBooking.php"), //"nomer":no.toString()
        body: {"tempat":tempat.text,"tanggal":tanggal,"email":UserDetail.email.text,"nomer":no});
      dialogBerhasil();
    }
    catch(err){
      print(err);
    }

  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kuota tempat habis'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Maaf. Kuota untuk '+tempat.text+' sudah penuh.'),
                Text('Mohon pilih tanggal lain atau pilih tempat yang lain.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  
  Future<void> dialogBerhasil() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berhasil'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Selamat booking anda telah berhasil'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (Route<dynamic> route) => false);
              },
            ),
            TextButton(
              child: const Text('CEK TRANSAKSI'),
              onPressed: () {
                Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Transaksi()), (Route<dynamic> route) => false);
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
    email.text = UserDetail.nama.text; 
    tempat.text = Pesan.tempat;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff56B9F5),
        leading: IconButton(
          onPressed:()=> Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (Route<dynamic> route) => false),
          icon: Icon(Icons.arrow_back_ios)),
        title: Text("Ambil Antrian"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 2,),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Detail antrian", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
          ),


          Spacer(flex: 2,),
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
                hintStyle: TextStyle(color: Colors.black87),
                border: UnderlineInputBorder(),
              ),
              controller: email,
              enabled: false,
            )
          ),

          Spacer(flex: 1,), //Tempat
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Tempat", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: TextField(
              controller:tempat,
               decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black87),
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            ),
          ),

          Spacer(flex: 1,), //Tempat
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Tanggal", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            child: TextField(
                controller: dateinput, 
                decoration: InputDecoration( 
                   suffixIcon: Icon(Icons.calendar_today,color: Color(0xff56B9F5)), 
                   hintText: "Masukkan tanggal",
                ),
                readOnly: true,  
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime.now(), 
                      lastDate: DateTime.now().add(Duration(days: 3))
                  );                  
                  if(pickedDate != null ){
                      String formattedDate = DateFormat("EEEE, d MMMM y", "id_ID").format(pickedDate); 
                      setState(() {
                         dateinput.text = formattedDate;
                          tgl = pickedDate;
                      });
                  }
                },
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
                  getNomer();
                },
                child: Text("LANJUTKAN", style: TextStyle(
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
