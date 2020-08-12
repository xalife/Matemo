import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Giris extends StatefulWidget {
  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  var email,pass;
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
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
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
                    padding: const EdgeInsets.only(top: 8.0),
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
                          controller: emailController,
                          decoration: InputDecoration(                            
                            prefixIcon: Icon(Icons.email,color: Colors.green,),
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
                          controller: passController,
                          decoration: InputDecoration(hintText: "Parola",  
                            prefixIcon: Icon(Icons.lock,color: Colors.green,),
                           ),
                          
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width/3,
                         //minWidth: 150,
                          child: Text("Giriş",style: TextStyle(color: Colors.white),),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        splashColor: Colors.blueAccent,
                        color: Color.fromRGBO(104, 0, 213, 1),
                        onPressed: () {
                          signInToApp();
                        },
                      ),
                    ],
                  ),
                ],
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

  signInToApp(){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passController.text).then((value) => {
      Navigator.pushReplacementNamed(context, "profil")
    });
  }

}
