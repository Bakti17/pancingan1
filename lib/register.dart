import 'package:flutter/material.dart';
import './login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController kel = TextEditingController();
  TextEditingController hp = TextEditingController();
  bool hide = true;

  void regis() async{
    try{
      var response = await http.post(Uri.parse("http://10.0.2.2/pancingan/insertAkun.php"), 
          body: {"email":email.text,"nama":nama.text,"pass":pass.text,"kel":kel.text,"hp":hp.text});
      Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => LoginPage(),
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
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[ 
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xff56B9F5)
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 1,),
            Container(
              alignment: Alignment.center,
              child: const Text("Register",
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
                controller: email,
                decoration: const InputDecoration.collapsed(hintText: 'Email')
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
                controller: nama,
                decoration: const InputDecoration.collapsed(hintText: 'Nama')
              ),
            ),
            const Spacer(flex: 1,),
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
                controller: kel,
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
                controller: hp,
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
                onPressed: ()=>regis(),
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18),
                ),),
            ),
            const Spacer(flex: 2,),
            const Text(
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
              child: const Text(
                "Login disini",
                style: TextStyle(
                  color: Color(0xff00609B),
                  fontSize: 16
                ),
              )
            ),
            const Spacer(flex: 1,)
          ],
        ),
        ],
      ),
    );
  }
}