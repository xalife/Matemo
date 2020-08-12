import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matemo/quizpage.dart';

class Dersler extends StatefulWidget {
  Dersler({Key key}) : super(key: key);
  @override
  _DerslerState createState() => _DerslerState();
}

class _DerslerState extends State<Dersler> {
  TextEditingController editingController = TextEditingController();

  List<String> duplicateItems = new List<String>();

  var items = List<String>();

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  void initState() {
    duplicateItems.add("Temel Kavramlar");
    duplicateItems.add("Sayılar-Sayı Basamakları");
    duplicateItems.add("Bölme-Bölünebilme");
    duplicateItems.add("OBEB-OKEK");
    duplicateItems.add("Rasyonel Sayılar");
    duplicateItems.add("Basit Eşitsizlikler");
    duplicateItems.add("Mutlak Değer");
    duplicateItems.add("Üstlü Sayılar");
    duplicateItems.add("Köklü Sayılar");
    duplicateItems.add("Çarpanlara Ayırma");
    duplicateItems.add("Oran Orantı");
    duplicateItems.add("Denklem Çözme");
    duplicateItems.add("Problemler");
    duplicateItems.add("Kümeler-Kartezyen Çarpım");
    duplicateItems.add("Fonksiyonlar");
    duplicateItems.add("Permütasyon");
    duplicateItems.add("Kombinasyon");
    duplicateItems.add("Binom");
    duplicateItems.add("Olasılık");
    duplicateItems.add("İstatistik");
    duplicateItems.add("2. dereceden denklemler");
    duplicateItems.add("Karmaşık Sayılar");
    duplicateItems.add("Polinomlar");
    duplicateItems.add("Mantık");
    items.addAll(duplicateItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return this.keyboardDismisser(
      context: context,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Color.fromRGBO(0, 159, 215, 1),
                    Color.fromRGBO(0, 80, 108, 1)
                  ])),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 16,
                  right: MediaQuery.of(context).size.width / 16,
                  top: MediaQuery.of(context).size.width / 10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Theme(
                      data: new ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Colors.blue,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        controller: editingController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: "Ara",
                            hintText: "Ara",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context) => getjson(),));
                            
                            },
                            child: Card(
                              elevation: 30,
                              color: Color.fromRGBO(255, 255, 255, 100),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width / 10,
                                    bottom:
                                        MediaQuery.of(context).size.width / 10,
                                    left:
                                        MediaQuery.of(context).size.width / 10),
                                child: Text('${items[index]}'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget keyboardDismisser({BuildContext context, Widget child}) {
    final gesture = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: child,
    );
    return gesture;
  }
}
