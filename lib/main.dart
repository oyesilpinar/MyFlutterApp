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
  String mesaj = "Merhaba ilk uygulamam";

  var ogrenciler = ["Yavuz Ceyhun","Hakan Soylu","Demir Ural"];

  @override
  Widget build(BuildContext context) {
    String mesaj = "First App";

    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),

    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 80) {
      mesaj = "AA-Geçti";
    } else if (puan >= 70) {
      mesaj = " BA-Geçti";
    } else if (puan >= 55) {
      mesaj = " CB-Geçti";
    } else if (puan >= 40) {
      mesaj = "Sorumlu Geçti";
    } else {
      mesaj = "Büte Kaldınız";
    }

    return mesaj;
  }

  void mesajGoster(BuildContext context,mesaj) {
    var alert = AlertDialog(
      title: const Text("Sonuçlar"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  buildBody(BuildContext context) {

    return Column(
      children: <Widget>[
        Center(
          child: ElevatedButton(
            child: const Text("Sonucu Gör"),
            onPressed: () {
              var mesaj=sinavHesapla(45);
              mesajGoster(context,mesaj);
            },
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: ogrenciler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(ogrenciler[index]);
                })),
      ],
    );

  }
}
