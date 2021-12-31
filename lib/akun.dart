import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pancingan1/akunEdit.dart';
import 'package:pancingan1/login.dart';
import 'package:pancingan1/transaksi.dart';
import 'homepage.dart';

class Akun extends StatefulWidget {
  const Akun({ Key? key }) : super(key: key);

  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> { 
  

  @override
  void initState() { 
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff56B9F5),
        title: const Text("Akun"),),
        
      body: Column(
        children: [
          Container(
            child: Container(
              width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.79,
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
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffDEDEDE)
                        ))
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff626A7D)
                          ),
                        ),
                        Spacer(),
                        Text(
                          UserDetail.email.text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xffDEDEDE)
                        ),
                        bottom: BorderSide(
                          color: Color(0xffDEDEDE)
                        ))
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Nama",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff626A7D)
                          ),
                        ),
                        Spacer(),
                        Text(
                          UserDetail.nama.text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xffDEDEDE)
                        ),
                        bottom: BorderSide(
                          color: Color(0xffDEDEDE)
                        ))
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Kelamin",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff626A7D)
                          ),
                        ),
                        Spacer(),
                        Text(
                          UserDetail.kelamin.text,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    alignment: Alignment.centerLeft,
                    decoration:const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xffDEDEDE)
                        ),
                        bottom: BorderSide(
                          color: Color(0xffDEDEDE)
                        ))
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Hp",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff626A7D)
                          ),
                        ),
                        Spacer(),
                        Text(
                          UserDetail.hp.text,
                          style:const TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex:1),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(            
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ElevatedButton(
                      child: const Text(
                        "Edit Akun",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto Bold'
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff56B9F5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        elevation: 10
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AkunEdit()));
                      },
                      
                    ),
                  ),
                  const Spacer(flex: 10,),
                  const Text(
                    "Version 1.1",
                    style: TextStyle(
                      color: Color(0xffbababa),
                      fontSize: 12,
                      fontFamily: 'Roboto Bold'
                    ),
                  ),
                  const Spacer(flex: 1,),
                ],
              ),
            ),
          ),
           Barnavigasi3()
        ],
      ),
    );
  }
}


class Barnavigasi3 extends StatefulWidget {
  const Barnavigasi3({ Key? key }) : super(key: key);

  @override
  _Barnavigasi3State createState() => _Barnavigasi3State();
}

class _Barnavigasi3State extends State<Barnavigasi3> {
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
                      color: Color(0xff56B9F5),                    
                    ),),                
                    Container(
                      padding:const EdgeInsets.only(top: 2),
                      child:const Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff56B9F5),
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