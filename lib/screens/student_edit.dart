import 'package:deneme01/models/student.dart';
import 'package:deneme01/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;

  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;

  var formKey = GlobalKey<FormState>();

  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(
        labelText: "Öğrenci Adı",
        hintText: "Zafer",
      ),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(
        labelText: "Öğrenci Soyadı",
        hintText: "Güler",
      ),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(
        labelText: "Öğrenci Notu",
        hintText: "65",
      ),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          Navigator.pop(context);
        }
      },
    );
  }
}
