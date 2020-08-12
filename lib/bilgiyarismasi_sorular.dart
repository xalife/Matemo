import 'package:flutter/material.dart';

class Quests extends StatefulWidget {
  Quests({Key key}) : super(key: key);

  @override
  _QuestsState createState() => _QuestsState();
}

class _QuestsState extends State<Quests> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemBuilder: (context, index) {
          return BilgiPage();
        },
    );
  }
}

class BilgiPage extends StatefulWidget {
  @override
  _BilgiPageState createState() => _BilgiPageState();
}

class _BilgiPageState extends State<BilgiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            
          ),
        ],
      ),
    );
  }
}