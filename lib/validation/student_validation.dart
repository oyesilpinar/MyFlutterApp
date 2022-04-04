class StudentValidationMixin{


  String? validateFirstName(String? value){

    if (value == null) return "İsim boş olamaz!";
    if(value.length<2){
      return "İsim en az iki karekter olmalı";
    }
    return null;
  }

  String? validateLastName(String? value){

    if (value == null) return "Soyad boş olamaz!";
    if(value.length<2){
      return "Soyad en az iki karekter olmalı";
    }
    return null;
  }

  String? validateGrade(String? value){
    var grade=int.parse(value!);
    if(grade<=0 || grade>=100){
      return "Not 1 ile 100 arasında olmalı";
    }
    return null;
  }

}