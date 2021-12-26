import 'package:flutter/material.dart';
import 'package:pancingan1/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[ 
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xff56B9F5)
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 1,),
            Container(
              alignment: Alignment.center,
              child: Text("Register",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(flex: 1,),
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
                decoration: InputDecoration.collapsed(hintText: 'Nama')
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
                decoration: InputDecoration.collapsed(hintText: 'Kelamin')
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
                decoration: InputDecoration.collapsed(hintText: 'Hp')
              ),
            ),
            Spacer(flex: 1,),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: Color(0xff1DA1F2),
                borderRadius: BorderRadius.circular(40)
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  )
                ),
                onPressed: (){},
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18),
                ),),
            ),
            Spacer(flex: 2,),
            Text(
              "Sudah punya akun?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
            TextButton(
              onPressed: (){Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => LoginPage(),
                      transitionDuration: Duration.zero,
                  ),
                );}, 
              child: Text(
                "Login disini",
                style: TextStyle(
                  color: Color(0xff00609B),
                  fontSize: 16
                ),
              )
            ),
            Spacer(flex: 1,)
          ],
        ),
        ],
      ),
    );
  }
}