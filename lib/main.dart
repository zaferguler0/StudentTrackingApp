import 'package:deneme01/models/student.dart';
import 'package:deneme01/screens/student_add.dart';
import 'package:deneme01/screens/student_edit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0, "", "", 0, "");

  List<Student> students = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(students[index].profilePicture),
                ),
                title: Text(
                    students[index].firstName + " " + students[index].lastName),
                subtitle: Text("Sınavdan aldığı not : " +
                    students[index].grade.toString() + " ["+students[index].getStatus+"]"),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    selectedStudent = students[index];
                  });
                  print(students[index].firstName +
                      " " +
                      students[index].lastName);
                },
              );
            },
          ),
        ),
        Text("Seçili Öğrenci : "+ selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2 ,
              child: RaisedButton(
                color: Colors.greenAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students))).then((_){
                        setState(() {

                        });
                      });
                    });
                  },
                ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.black12,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5,),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentEdit(selectedStudent))).then((_){
                    setState(() {

                    });
                  });
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5,),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj = "Silindi : "+selectedStudent.firstName;
                  mesajGoster(context, mesaj);
                },
              ),
            )
          ],
        ),


      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
