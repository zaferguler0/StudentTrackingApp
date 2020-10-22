import 'package:deneme01/models/student.dart';
import 'package:flutter/material.dart';

class SelectAvatar extends StatefulWidget {

  @override
  _SelectAvatarState createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  String sectim = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Seçme Ekranı"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        primary: false,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        children: [
          GestureDetector(
            child: Container(
              child: Image.asset("assets/images/man.png"),
            ),
            onTap: () => {
              sectim = "assets/images/man.png",
              Navigator.pop(context, sectim),
            },
          ),
          GestureDetector(
            child: Container(
              child: Image.asset("assets/images/man2.png"),
            ),
            onTap: () => {
              sectim = "assets/images/man2.png",
              Navigator.pop(context, sectim),
            },
          ),
          GestureDetector(
            child: Container(
              child: Image.asset("assets/images/man3.png"),
            ),
            onTap: () => {
              sectim = "assets/images/man3.png",
              Navigator.pop(context, sectim),
            },
          ),
          GestureDetector(
            child: Container(
              child: Image.asset("assets/images/man4.png"),
            ),
            onTap: () => {
              sectim = "assets/images/man4.png",
              Navigator.pop(context, sectim),
            },
          ),
          GestureDetector(
            child: Container(
              child: Image.asset("assets/images/girl.png"),
            ),
            onTap: () => {
              sectim = "assets/images/girl.png",
              Navigator.pop(context, sectim),
            },
          ),
          GestureDetector(
            child: Container(
              child: Image.asset("assets/images/girl2.png"),
            ),
            onTap: () => {
              sectim = "assets/images/girl2.png",
              Navigator.pop(context, sectim),
            },
          ),
        ],
      )
    );
  }
}
