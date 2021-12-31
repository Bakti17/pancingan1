import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:pancingan1/homepage.dart';
import 'package:pancingan1/register.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool hide = true;
  
  void login() async{
    try{
      var response = await http.post(Uri.parse("http://10.0.2.2/pancingan/login.php"), body: {"email":email.text,"ubah":pass.text});
      List list = json.decode(response.body);
    setState(() {
      UserDetail.email.text = list[0]['email'];
      UserDetail.nama.text = list[0]['nama'];
      UserDetail.kelamin.text = list[0]['kelamin'];
      UserDetail.hp.text = list[0]['hp'];
    });
    Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => HomePage(),
                      transitionDuration: Duration.zero,
                  ),
                );
    }catch(err){
      print(err);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Spacer(flex: 2,),
            // SizedBox(height: 60,),
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
          //  SizedBox(height: 30,),
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
          //  SizedBox(height: 30,),
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
            // SizedBox(height: 30,),
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
                controller: email,
                decoration: InputDecoration.collapsed(hintText: 'Email')
              ),
            ),
            Spacer(flex: 1,),
            // SizedBox(height: 30,),
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
                obscureText: hide,
                controller: pass,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => hide =
                                        !hide,
                                  ),
                                  child: Icon(
                                    hide
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                )
              ),
            ),
            Spacer(flex: 1,),
            // SizedBox(height: 30,),
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
                onPressed: (){
                  login();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18),
                ),),
            ),
            Spacer(flex: 1,),
            // SizedBox(height: 20,),
            Text(
              "Belum punya akun?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
            TextButton(
              onPressed: (){Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => RegisterPage(),
                      transitionDuration: Duration.zero,
                  ),
                );}, 
              child: Text(
                "Register disini",
                style: TextStyle(
                  color: Color(0xff00609B),
                  fontSize: 16
                ),
              )
            ),
            Spacer(flex: 1,),
            // SizedBox(height: 10,),
          ],
        ),
        ],
      ),
    );
  }
}



class UserDetail extends StatefulWidget {
  static TextEditingController email = TextEditingController();
  static TextEditingController nama = TextEditingController();
  static TextEditingController kelamin = TextEditingController();
  static TextEditingController hp = TextEditingController();

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}