import 'package:deneme01/models/student.dart';
import 'package:deneme01/screens/select_avatar.dart';
import 'package:deneme01/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;

  StudentAdd(List<Student> students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  String gelmis = "";
  List<Student> students;

  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                SizedBox(height: 10),
                buildSubmitButton(),
                SizedBox(height: 10),
                selectAvatar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Öğrenci Adı",
        hintText: "Zafer",
      ),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Öğrenci Soyadı",
        hintText: "Güler",
      ),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Öğrenci Notu",
        hintText: "65",
      ),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          students.add(student);
          Navigator.pop(context);
          print(student.firstName);
          print(student.lastName);
          print(student.grade);
        }
      },
    );
  }

  selectAvatar() {
    return Column(
      children: [
        RaisedButton(
          child: Text("Avatar Seç"),
          onPressed: () {
            avatarSayfasiniCagir(context);
          },
        ),
        SizedBox(height: 10),
        Image.asset(
          gelmis,
          height: 200,
          width: 200,
        ),
      ],
    );
  }

  void avatarSayfasiniCagir(BuildContext context) async {
    final gelen = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectAvatar()));
    setState(() {
      gelmis = gelen.toString();
      student.profilePicture = gelmis;
      return gelmis;
    });
  }
}
