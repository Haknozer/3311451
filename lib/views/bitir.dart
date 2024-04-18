import 'package:e_sinav/main.dart';
import 'package:flutter/material.dart';

class Bitir extends StatefulWidget {
  String ad_soyad;
  String ogr_numara;
  int kullanilan_zaman;
  int puan;

  Bitir(this.ad_soyad, this.ogr_numara, this.kullanilan_zaman, this.puan);


  @override
  State<Bitir> createState() => _BitirState();
}

class _BitirState extends State<Bitir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("E-SINAV SONUÇ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text(widget.ad_soyad,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const Divider(color: Colors.transparent,),
            Text(widget.ogr_numara,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const Divider(color: Colors.transparent,),
            Text("Kullanılan Zaman : ${widget.kullanilan_zaman.toString()}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const Divider(color: Colors.transparent,),
            Text("Toplam Puan : ${widget.puan}",style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const Divider(color: Colors.transparent,),
            ElevatedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
                },
                child: const Text("Ana Sayfaya Dön",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
