import 'dart:convert';
import './homepage.dart';
import './Akun.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Transaksi extends StatefulWidget {

  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff56B9F5),
        title: const Text("Aktivitas Saya"),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.79,
            decoration: BoxDecoration(   
                color: Colors.white,
                boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 5),
                ),
              ],                             
              ),
            child: Antrian()
          ),
          BarNavigasi2()
        ],
      ),
    );
  }
}

class Antrian extends StatefulWidget {

  @override
  _AntrianState createState() => _AntrianState();
}

class _AntrianState extends State<Antrian> {
  List listAntrian = [
    {"nama_tempat": "Pemancingan Mas Celeng", "tanggal":"12 Desember 2021","nomor":"12"},
    {"nama_tempat": "Pemancingan Mas Celeng", "tanggal":"12 Desember 2021","nomor":"12"},
    {"nama_tempat": "Pemancingan Mas Celeng", "tanggal":"12 Desember 2021","nomor":"12"},
    {"nama_tempat": "Pemancingan Mas Celeng", "tanggal":"12 Desember 2021","nomor":"12"},
  ];

  // Future getAntrian() async{
  //   final response = await http.post(Uri.parse("http://10.0.2.2/antriyuk/getAntrian.php"),body: {"email":user.email,"status":"Dipesan"});
  //   setState(() {
  //     listAntrian = jsonDecode(response.body);
  //   });
  // }

  @override
  void initState() { 
    super.initState();
    // getAntrian();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listAntrian.length,
      itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.only(top:20,left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
               boxShadow:const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(1, 10), // changes position of shadow
                  ),
                ],
            ),
            child:Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const [
                    Text(
                      "Tempat",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Tanggal",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "No Duduk",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listAntrian[index]['nama_tempat'],
                      style:const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      listAntrian[index]['tanggal'],
                      style:const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      listAntrian[index]['nomor'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    SizedBox(height: 5),
                  ],)
              ],
            )
          ),
        );
      }
    );
  }
}


class BarNavigasi2 extends StatefulWidget {
  const BarNavigasi2({ Key? key }) : super(key: key);

  @override
  _BarNavigasi2State createState() => _BarNavigasi2State();
}

class _BarNavigasi2State extends State<BarNavigasi2> {
  @override
  Widget build(BuildContext context) {
    return Container(      
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.091,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,                        
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => HomePage(),
                      transitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.1),
                shadowColor: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 30,                  
                    child: Icon(
                      Icons.home,
                      size: 30,
                      color: Color(0xff6E6E6E),                    
                    ),),
                    Container(
                      padding:const EdgeInsets.only(top: 2),
                      child:const Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E)
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),        
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,        
            child: ElevatedButton(
              onPressed: (){ },
                style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.1),
                shadowColor: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 30,                  
                    child: Icon(
                      Icons.sync_alt_rounded,
                      size: 36,
                      color: Color(0xff56B9F5),                    
                    ),),
                    Container(
                      padding:const EdgeInsets.only(top: 2),
                      child:const Text(
                        "Transaksi",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff56B9F5),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),          
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => Akun(),
                      transitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.1),
                shadowColor: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 30,                                      
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Color(0xff6E6E6E),                    
                    ),),                
                    Container(
                      padding:const EdgeInsets.only(top: 2),
                      child:const Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}