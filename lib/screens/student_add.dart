import 'package:demo_flutter_project/models/student.dart';
import 'package:demo_flutter_project/validation/student_validation.dart';
import 'package:flutter/material.dart';



class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student =Student.withoutInfo();
  var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSumbitButton(),
            ],
          ),
        ),
      )
    );
  }

  buildFirstNameField() {

    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı:",hintText: "Mehmet"),
      validator: validateFirstName,
      onSaved: (String? value){
        student.firstName=value!;
      },
    );
    
  }

  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı:",hintText: "Kara"),
      validator: validateFirstName,
      onSaved: (String? value){
        student.lastName=value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not:",hintText: "60"),
      validator: validateFirstName,
      onSaved: (String? value){
        student.grade= int.parse(value!);
      },
    );
  }

  buildSumbitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed:(){
         if(formKey.currentState!.validate()){
           formKey.currentState!.save();
           saveStudent();
         }
    },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }


}
