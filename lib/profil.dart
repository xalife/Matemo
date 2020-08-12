import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neuomorphic_container/neuomorphic_container.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  double kutubir = 0;
  double kutuiki = 0;
  double kutuuc = 0;
  double kutudort = 0;
  double blursay = 15;
  double blur1 = 15;
  double blur2 = 15;
  double blur3 = 15;
  double blur4 = 15;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 15,
            right: MediaQuery.of(context).size.width / 10,
            child: Stack(
              children: <Widget>[
                Image(
                  width: 50,
                  image: AssetImage('images/icon_settings.png'),
                )
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.15,
            left: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        "İslam Özçelik",
                        style: TextStyle(fontFamily: 'Swatch'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "Sayfan",
                          style: TextStyle(fontFamily: 'Brother'),
                        )),
                        Image(image: AssetImage('images/down_icon.png')),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  height: 3,
                  decoration: BoxDecoration(color: Colors.black),
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                primary: false,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  String subtitle;
                  double kuturengi;
                  if (index == 0) {
                    subtitle = "İlgi Alanların";
                    kuturengi = kutubir;
                    blursay = blur1;
                  } else if (index == 1) {
                    subtitle = "Havuz";
                    kuturengi = kutuiki;
                    blursay = blur2;
                  } else if (index == 2) {
                    subtitle = "Eğlence";
                    kuturengi = kutuuc;
                    blursay = blur3;
                  } else {
                    kuturengi = kutudort;
                    blursay = blur4;
                    subtitle = "Favoriler";
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (index == 0) {
                                  if (kutubir == 150) {
                                    kutubir = 0;
                                    blur1 = 0;
                                  } else {
                                    kutubir = 150;
                                    blur1 = 15;
                                  }
                                  Navigator.pushNamed(context, "dersler");
                                }
                                if (index == 1) {
                                  if (kutuiki == 150) {
                                    kutuiki = 0;
                                    blur2 = 0;
                                  } else {
                                    kutuiki = 150;
                                    blur2 = 15;
                                  }
                                  Navigator.pushNamed(context, "havuz");
                                }

                                if (index == 2) {
                                  if (kutuuc == 150) {
                                    kutuuc = 0;
                                    blur3 = 0;
                                  } else {
                                    kutuuc = 150;
                                    blur3 = 15;
                                  }
                                  Navigator.pushNamed(context, "bilgi");
                                }

                                if (index == 3) {
                                  if (kutudort == 150) {
                                    kutudort = 0;
                                    blur4 = 0;
                                  } else {
                                    blur4 = 15;
                                    kutudort = 150;
                                  }
                                  Navigator.pushNamed(context, "video");
                                }
                              });
                            },
                            child: NeuomorphicContainer(
                              color: Color(0xFF398AE5),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(10),
                              ),
                              style: NeuomorphicStyle.Concave,
                              intensity: 0.35,
                              offset: Offset(0.0, 0.0),
                              blur: blursay,
                              /*
                              child: AnimatedContainer(
                                
                                duration: Duration(seconds: 1),
                                
                                width: 150,
                                decoration: BoxDecoration(
                                 
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  border: Border.all(color: Color(0xFF398AE5)),
                                ),
                              ),
                              */
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 90),
                          child: Text(
                            subtitle,
                            style: TextStyle(fontFamily: 'Swatch'),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*


              child: GridView.builder(
                itemCount: 4,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              );
            },
          )
        
        */
