class Student{
  int id=0;
  String firstName="";
  String  lastName="";
  int grade=0;
  String _status="";



  Student.withId(int id,String firtsName,String lastName,int grade){

    this.id=id;
    this.firstName=firtsName;
    this.lastName=lastName;
    this.grade=grade;
  }

  Student(String firtsName,String lastName,int grade){


    this.firstName=firtsName;
    this.lastName=lastName;
    this.grade=grade;
  }


  String get getFirstName{
    return "Ogrenci:"+this.firstName;

  }
  void set setFirstName(String value){
    this.firstName=value;
  }

  Student.withoutInfo(){

}


  String get getStatus{
    String message = "";
    if (this.grade >= 80) {
      message = "AA-Geçti";
    } else if (this.grade >= 70) {
      message = " BA-Geçti";
    } else if (this.grade >= 55) {
      message = " CB-Geçti";
    } else if (this.grade >= 40) {
      message = "Sorumlu Geçti";
    } else {
      message = "Büte Kaldınız";
    }

    return message;
  }

}