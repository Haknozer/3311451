import 'package:e_sinav/views/bitir.dart';
import 'package:e_sinav/views/hata.dart';
import 'package:e_sinav/views/sorular.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String ad_soyad = "";
  String ogr_numara = "";
  bool butonKontrol = true;

  @override
  Widget build(BuildContext context) {


    void bilgiKontrol(){
      var data = [];
      if(ad_soyad.length > 9 && ogr_numara.length == 9){
        data.add(ad_soyad);
        data.add(ogr_numara);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Sorular(ad_soyad, ogr_numara),));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Hata(),));
      }
    }

    if(ad_soyad.length > 9 && ogr_numara.length == 9){
      butonKontrol = false;
    } else {
      butonKontrol = true;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("E-SINAV"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Ad Soyad Giriniz",
                  border: OutlineInputBorder()
                ),
                onChanged: (value) {
                  setState(() {
                    ad_soyad = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Öğrenci Numaranızı Giriniz",
                  border: OutlineInputBorder()
                ),
                onChanged: (value) {
                  setState(() {
                    ogr_numara = value;
                  });
                },
              ),
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: (){
                  print(butonKontrol);
                  butonKontrol ? null : bilgiKontrol();
                  print(butonKontrol);
                  print(ad_soyad + ogr_numara);
                },
                child: const Text("Bilgiler Kaydet",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
