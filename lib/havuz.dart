import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Havuz extends StatefulWidget {
  
  @override
  _HavuzState createState() => _HavuzState();
}




class _HavuzState extends State<Havuz> {
  bool downloading = false;
  var progresString = "indir";
  
  Future<void> downloadFile(String path) async{

  Dio dio = Dio();

  try{
    var dir = await getApplicationDocumentsDirectory();
    await dio.download(path, "${dir.path}/assets/questions/temel.json",onReceiveProgress: (count, total) {
      debugPrint("Rec: $count, Total: $total");

        setState(() {
          downloading = true;
          progresString = ((count/total) * 100).toStringAsFixed(0) + "%";
        });
      
    },);
  }
  catch(e){
    debugPrint(e);
  }
  setState(() {
    downloading = false;
    progresString = "indi";
  });
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          
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
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            
            child: StreamBuilder(
              stream:Firestore.instance.collection("Testler").snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(                   
                    
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot shot = snapshot.data.documents[index];
                      return ListTile(
                        focusColor: Colors.white,
                        title: Text(shot.data['isim']),
                        subtitle: Text("Bu Testi İndirmek için yandaki icona tıklayınız!"),
                        trailing: FlatButton.icon(icon: downloading ? CircularProgressIndicator() : Icon(Icons.arrow_downward) , label: Text(progresString),onPressed: () {
                          downloadFile(shot.data['kaynak']);
                          
                        },),
                      );
                      
                    },
                  );
                }
                else{
                  return Text(
                    "Yükleniyor..."
                  );
                }
                
              },
            ),
          ),

        ],
      ),
    );
  }
}