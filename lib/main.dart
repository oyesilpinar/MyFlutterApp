import 'package:demo_flutter_project/models/student.dart';
import 'package:demo_flutter_project/screens/student_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";
  Student selectedStudent = Student.withId(0, "", "", 0);
  List<Student> students = [
    Student.withId(1,"Erhan", "Çoker", 85),
    //Student.withId(2,"Oguz", "Ozat", 25),
    Student.withId(2,"Oguz", "Ozat", 25),
    Student.withId(3,"Berkay", "Ağır", 45),
    //Student.withId(3,"Berkay", "Ağır", 45),
    Student.withId(4,"Faruk", "Bera", 75)
  ];

  var ogrenciler = ["Yavuz Ceyhun", "Hakan Soylu", "Demir Ural"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, mesaj) {
    var alert = AlertDialog(
      title: const Text("İşlem Sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child:  Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"),
                        ),
                        title: Text(students[index].firstName +
                            " " +
                            students[index].lastName),
                        subtitle: Text("Sınavdan aldığı not: " +
                            students[index].grade.toString() +
                            " (" +
                            students[index].getStatus +
                            ")"),
                        trailing: buildStatusIcon(students[index].grade),
                        onTap: () {
                          setState(() {
                            selectedStudent = students[index];
                          });
                        });
                  })),
          Text("Seçii Öğrenci:" + selectedStudent.firstName),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.add),
                      SizedBox(width: 5,),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd()));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                  child:  Row(
                    children: const [
                      Icon(Icons.update),
                      SizedBox(width: 5,),
                      Text("Güncelle"),
                    ],
                  ),
                  onPressed: () {
                    var mesaj = "Güncellendi";
                    mesajGoster(context, mesaj);
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.delete),
                      SizedBox(width: 5,),
                      Text("Sil"),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    var mesaj = "Öğrenci Silindi : "+selectedStudent.firstName+" "+selectedStudent.lastName;
                    mesajGoster(context, mesaj);
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );


  }

  buildStatusIcon(int grade) {
    if (grade >= 80) {
      return Icon(Icons.done);
    } else if (grade >= 70) {
      return Icon(Icons.done);
    } else if (grade >= 55) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
/*
buildSettingsLayout(){
  //Layout kısmındaki butonların alta kaymasını engelleme
    var a=const Text("\n\n");
    return a;
}
 */
