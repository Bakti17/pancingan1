import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[ 
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xff1DA1F2)
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 1,),
            Container(
              alignment: Alignment.center,
              child: Text("Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(flex: 1,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width *0.44,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('images/logopancingan.png')
              ),
            ),
            Spacer(flex: 1,),
            Container(
              alignment: Alignment.center,
              child: Text("Pancingan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(flex: 1,),
            Container(
              padding: EdgeInsets.only(left:20,right:10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width *0.7,              
              height: MediaQuery.of(context).size.height * 0.058,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'Email')
              ),
            ),
            Spacer(flex: 1,),
            Container(
              padding: EdgeInsets.only(left:20,right:10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width *0.7,              
              height: MediaQuery.of(context).size.height * 0.058,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'Password')
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}