class Student{
  int id;
  String firstName;
  String lastName;
  String profilePicture;
  int grade;
  String _status;

  Student.withId(int id, String firstName, String lastName, int grade, String profilePicture){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.profilePicture = profilePicture;
  }

  Student(String firstName, String lastName, int grade, String profilePicture){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.profilePicture = profilePicture;
  }

  Student.withoutInfo(){}

  String get getfirstName{
    return "OGR - " + this.firstName;
  }

  void set setfirstName(String value){
    this.firstName = value;
  }

  String get getStatus{
    String message = "";
    if (this.grade >= 50) {
      message = "gecti";
    } else if (this.grade >= 40) {
      message = "Bütünlemeye Kaldi";
    } else {
      message = "kaldı";
    }
    return message;
  }


}