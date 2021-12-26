import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pancingan1/login.dart';
import 'package:pancingan1/transaksi.dart';
import 'package:http/http.dart' as http;
import 'akun.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                Spacer(flex: 2,),
                Container(
                  child: Image.asset(
                    'images/background_home.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Spacer(flex: 1,)
            ],)
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Text(
                  "Hi " + UserDetail.nama.text,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto Medium'
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                alignment: Alignment.center,
                // color: Colors.red,
                child: DaftarTempat(),
              ),
              BarNavigasi()
            ]
          )
        ],
      ),
    );
  }
}

class DaftarTempat extends StatefulWidget {
  const DaftarTempat({ Key? key }) : super(key: key);

  @override
  _DaftarTempatState createState() => _DaftarTempatState();
}

class _DaftarTempatState extends State<DaftarTempat> {
  List list = [];

  void getData() async{
    var response = await http.get(Uri.parse("http://10.0.2.2/pancingan/getTempat.php"));
      setState(() {
        list = json.decode(response.body);  
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.23,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.only(left: 20, top: 10,bottom: 10),
                primary: Colors.white70,
                elevation: 10
              ),
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                      "http://10.0.2.2/pancingan/"+(list[index]['id']).toString()+".jpg",
                      fit: BoxFit.fill,
                      ),  
                  ),
                  SizedBox(
                    width: 20
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const SizedBox(
                        height: 10,
                      ),
                      Text(
                        list[index]['nama_tempat'],
                        style:const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ), 
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        list[index]['alamat'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ),
        );
      }
    );
  }
}



class BarNavigasi extends StatefulWidget {
  const BarNavigasi({ Key? key }) : super(key: key);

  @override
  _BarNavigasiState createState() => _BarNavigasiState();
}

class _BarNavigasiState extends State<BarNavigasi> {
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
              onPressed: (){},
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
                      color: Color(0xff56B9F5),                    
                    ),),
                    Container(
                      padding:const EdgeInsets.only(top: 2),
                      child:const Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff56B9F5)
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
                      pageBuilder: (context, animation1, animation2) => Transaksi(),
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
                      Icons.sync_alt_rounded,
                      size: 36,
                      color: Color(0xff6E6E6E),                    
                    ),),
                    Container(
                      padding:const EdgeInsets.only(top: 2),
                      child:const Text(
                        "Transaksi",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E),
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