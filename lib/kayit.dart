import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Kayit extends StatefulWidget {
  @override
  _KayitState createState() => _KayitState();
}
class _KayitState extends State<Kayit> {
  var mailController = TextEditingController();
  var nameController = TextEditingController();
  var pass1Controller = TextEditingController();
  var pass2Controller = TextEditingController();
  var mail,name,pass1,pass2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: new LinearGradient(colors: [
                Color.fromRGBO(104, 0, 213, 1),
                Color.fromRGBO(52, 0, 107, 1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:25),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.83,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      offset: new Offset(10.0, 10.0),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          FlatButton(
                            child: Text("Giriş"),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "giris");
                            },
                          ),
                          FlatButton(
                            child: Text("Kayıt Ol"),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "kayit");
                            },
                          ),
                        
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          width: MediaQuery.of(context).size.width * 0.83,
                          child: TextField(
                            controller: nameController,
                            onChanged: (value) {
                              name = value;
                              debugPrint(value);
                            },
                            
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.green,
                              ),
                              hintText: "İsim Soyisim",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          width: MediaQuery.of(context).size.width * 0.83,
                          child: TextField(
                            
                            controller: mailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.green,
                              ),
                              hintText: "E-Posta",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(

                          padding: EdgeInsets.only(left: 15, right: 15),
                          width: MediaQuery.of(context).size.width * 0.83,
                          child: TextField(
                            obscureText: true,
                            controller: pass1Controller,
                            decoration: InputDecoration(
                              hintText: "Parola",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          width: MediaQuery.of(context).size.width * 0.83,
                          child: TextField(
                            obscureText: true,
                            controller: pass2Controller,
                            decoration: InputDecoration(
                              hintText: "Parola Tekrar",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 3,
                          //minWidth: 150,
                          child: Text(
                            "Giriş",
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          splashColor: Colors.blueAccent,
                          color: Color.fromRGBO(104, 0, 213, 1),
                          onPressed: () {
                            //debugPrint("isim: "+nameController.text+"email: "+mailController.text);
                            checkForRegister();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 25,
            child: Text("MATEMO",
                style: TextStyle(
                    fontFamily: "Bauhaus", fontSize: 45, color: Colors.white)),
          ),
        ],
      ),
    );
  }
  checkForRegister(){
    if(pass1Controller.text == pass2Controller.text){
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: mailController.text, password: pass1Controller.text).then((value) => {
        Navigator.pushReplacementNamed(context, "profil")
      });
    }
  }
}
