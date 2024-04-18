import 'dart:async';

import 'package:e_sinav/views/bitir.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class Sorular extends StatefulWidget {
  String ad_soyad;
  String ogr_numara;
  Sorular(this.ad_soyad, this.ogr_numara);
  @override
  State<Sorular> createState() => _SorularState();
}

class _SorularState extends State<Sorular> {
  int mevcutSoru = 0;
  int puan = 0;
  int _start = 10;
  int kullanilanZaman = 0;
  var sorular = [
    {
      'soru': 'Fatih Sultan Mehmet\'in babası kimdir?',
    },
    {
      'soru': 'Hangi yabancı futbolcu Fenerbahçe forması giymiştir?',
    },
    {
      'soru': 'Magna Carta hangi ülkenin kralıyla yapılmış bir sözleşmedir?',
    },
    {
      'soru': 'Hangisi tarihteki Türk devletlerinden biri değildir?',
    },
    {
      'soru': 'Hangi ülke Asya kıtasındadır?',
    },
    {
      'soru': 'ABD başkanlarından John Fitzgerald Kennedy’e suikast düzenleyerek öldüren kimdir?',
    },
    {
      'soru': 'Aşağıdaki hangi Anadolu takımı Türkiye Süper Liginde şampiyon olmuştur?',
    },
    {
      'soru': 'Hangisi Kanuni Sultan Süleyman’ın eşidir?',
    },
    {
      'soru': 'Hangi hayvan memeli değildir?',
    },
    {
      'soru': 'Osmanlı’da Lale devri hangi padişah döneminde yaşamıştır?',
    },
  ];
  var cevaplistesi = [
    {
      'cevapbir': 'I. Mehmet',
      'cevapiki': 'II. Murat',
      'cevapuc':'Yıldırım Beyazıt',
      'dogrucevap': 'II. Murat'
    },
    {
      'cevapbir': 'Simoviç',
      'cevapiki': 'Schumacher',
      'cevapuc':'Prekazi',
      'dogrucevap': 'Schumacher'
    },
    {
      'cevapbir': 'İngiltere',
      'cevapiki': 'Fransa',
      'cevapuc': 'İspanya',
      'dogrucevap': 'İngiltere'
    },
    {
      'cevapbir': 'Avar Kağanlığı',
      'cevapiki': 'Emevi Devleti',
      'cevapuc':'Hun İmparatorluğu',
      'dogrucevap': 'Emevi Devleti'
    },
    {
      'cevapbir': 'Madagaskar',
      'cevapiki': 'Peru',
      'cevapuc': 'Singapur',
      'dogrucevap': 'Singapur'
    },
    {
      'cevapbir': 'Lee Harvey Oswald',
      'cevapiki': 'Clay Shaw',
      'cevapuc':'Jack Ruby',
      'dogrucevap': 'Lee Harvey Oswald'
    },
    {
      'cevapbir': 'Kocaelispor',
      'cevapiki': 'Bursaspor',
      'cevapuc':'Eskişehirspor',
      'dogrucevap': 'Bursaspor'
    },
    {
      'cevapbir': 'Safiye Sultan',
      'cevapiki': 'Kösem Sultan',
      'cevapuc':'Hürrem Sultan',
      'dogrucevap': 'Hürrem Sultan'
    },
    {
      'cevapbir': 'Penguen',
      'cevapiki': 'Yunus',
      'cevapuc':'Yarasa',
      'dogrucevap': 'Yunus'
    },
    {
      'cevapbir': 'III. Ahmet',
      'cevapiki': 'IV. Murat',
      'cevapuc':'III. Selim',
      'dogrucevap': 'III. Ahmet'
    },
  ];


  Future<void> sinavSon() async{
    if(mevcutSoru == 9){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Bitir(widget.ad_soyad, widget.ogr_numara, kullanilanZaman, puan),));
    }
  }

  void kontrolEt(String mevcutCevap){
    if(mevcutCevap == cevaplistesi[mevcutSoru]['dogrucevap'].toString()){
      sinavSon();
      puan += 10;
      mevcutSoru == 9 ? null : mevcutSoru++;
    } else {
      sinavSon();
      puan -= 10;
      mevcutSoru == 9 ? null : mevcutSoru++;
    }
  }

  Timer? _timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            if(mevcutSoru == 9) {
              _timer?.cancel();
              kullanilanZaman += (10-_start);
              sinavSon();
            } else {
              mevcutSoru++;
              kullanilanZaman += (10-_start);
            }
            _start = 10;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("E-SINAV", style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text(widget.ad_soyad,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(widget.ogr_numara,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text("Mevcut Soru / Toplam Soru " + (mevcutSoru + 1).toString() + "/" + sorular.length.toString(),style: const TextStyle(fontSize: 25),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(sorular[mevcutSoru]['soru'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            buildElevatedButton(cevaplistesi[mevcutSoru]['cevapbir'].toString()),
            buildElevatedButton(cevaplistesi[mevcutSoru]['cevapiki'].toString()),
            buildElevatedButton(cevaplistesi[mevcutSoru]['cevapuc'].toString()),
            Text(_start.toString(),style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(String cevap)
  => ElevatedButton(
      style: const ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(200, 60)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
        backgroundColor: MaterialStatePropertyAll(Colors.blue),

      ),
      onPressed: (){
        String mevcutCevap = "";
        setState(() {
          mevcutSoru == 9 ? _timer?.cancel() : null;
          kullanilanZaman += (10 - _start);
          _start = 10;
          mevcutCevap = cevap;
        });
        print(mevcutCevap);
        kontrolEt(mevcutCevap);
      },
      child:  Text(cevap,style: const TextStyle(color: Colors.white),));
}
