import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(benimuygulamam());
}

class benimuygulamam extends StatelessWidget {
  //benimuygulamam witgetimiz
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          // AppBar widgetinin başlığını yatay eksende merkezlemek için kullanılır.
          // Varsayılan olarak, başlık sola hizalanır.
          // centerTitle değerini true olarak ayarladığınızda,
          // başlık otomatik olarak AppBar içinde yatay eksende merkezlenir.
          title: Text(
            'BUGUN NE YESEM ? ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: yemeksayfasi(),
        ),
      ),
    );
  }
}

class yemeksayfasi extends StatefulWidget {
  @override
  State<yemeksayfasi> createState() => _yemeksayfasiState();
}

class _yemeksayfasiState extends State<yemeksayfasi> {
  //statelessWidget bu uygulama bir kez calistiginda yuklenen her sey
  // bir daha degismeyecek demek

  //degiskenlere ilk degerlerini atadik
  int corbaNo = 1;

  int yemekNo = 1;

  int tatliNo = 1;

  //her yemek türü icin list olusturduk
  List<String> yemekAdlari = [
    'Karniyarik',
    'Manti',
    'Kurufasulye',
    'Iclikofte',
    'Izgara Balik'
  ];

  List<String> tatliAdlari = [
    'Kadayif',
    'Baklava',
    'Sutlac',
    'Kazandibi',
    'Dondurma'
  ];

  List<String> corbaAdlari = [
    'Mercimek',
    'Tarhana',
    'Tavuk Suyu Corbasi',
    'Dugun Corbasi',
    'Yogurt Corbasi'
  ];

  void yemekleriYenile() {
    setState(() {
      yemekNo = Random().nextInt(5) + 1;
      corbaNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //expended widgeti cocugunun ekstra alani kaplaması icin ugrasıyor

        children: <Widget>[
          Expanded(
            //expanded witgetlerini padding ile sarmalarsan kardeslerin butunlugu
            //bozulur kapladiklari alan olarak duzensizlesirler
            //bunun yerine cocuklari pading ile kapladik
            //flex: 1, //resmin yukseklik genisligi 1 artti
            child: Padding(
              padding: const EdgeInsets.all(
                  12.0), //resmin yakınlık uzakligiyla ilgili
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.white, width: 20.0),
                ),
                child: TextButton(
                  //butona basıldıgında bu satirdan itibaren ve alti calisir
                  onPressed: () {
                    print('corba butonu tiklandi');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      //$bu işaret sayesinde $x x degiskenine gidip onun lanse ettigi degeri okuturuz
                      Image.asset('yemekresmi/corba_$corbaNo.jpg'),
                      InkWell(
                        splashColor: Colors.pinkAccent,
                        onTap: () {
                          setState(() {
                            //kullanicinin uyguladigi degisikligi ekrana yansitan fonksiyon
                            //corbaNo = Random().nextInt(5) + 1;
                            //bu fonksiyon sayesinde 0-5 arasnda rastgele sayi secer
                            //+1 sayesinde 0-4 araligini 0-5 aralagina cekeriz
                            //setState fonksiyonu sayesinde corbaya tıkladgimzda
                            //besinci numarali corba resmi geldi
                            yemekNo = Random().nextInt(5) + 1;
                            corbaNo = Random().nextInt(5) + 1;
                            tatliNo = Random().nextInt(5) + 1;
                          });
                          //corbaNo =5; //durumsuz witget icinde oldugumuz icin besinci corba resmi gelmedi
                          print('tiklanan corba numarasi: $corbaNo');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            //birinci yemegin metinsel bilgileri icin
            corbaAdlari[corbaNo - 1],
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          Container(
            //divider witgetinin cizgisini yazının ortasında degil de ustune getirmek icin yaptik
            width: 200, //cizginin uzunlugu
            child: Divider(
              //cizgi ceker
              height: 5,
              color: Colors.black,
            ),
          ),
          Expanded(
            //flex: 2, //resmin yukseklik genisligi 2adim artti
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.white, width: 20.0),
                ),
                child: TextButton(
                  onPressed: () {
                    print('corba butonu tiklandi');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('yemekresmi/yemek_$yemekNo.jpg'),
                      InkWell(
                        splashColor: Colors.pinkAccent,
                        // onLongPress: yemekleriYenile,

                        onTap: () {
                          //yemekNo = 5;
                          yemekleriYenile(); //burada yemekleri yenilemek icin
                          // fonksiyon cagirdik
                          print('tiklanan yemek numarasi: $yemekNo');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            //ikinci yemegin metinsel bilgileri icin
            yemekAdlari[yemekNo - 1],
            //-1 var cunku dizi bilgisini hatırla indexler0dan baslar
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          Container(
            //divider cizgisini yazının ortasında degil de ustune getirmek icin yaptik
            width: 200,
            child: Divider(
              height: 1,
              color: Colors.black,
            ),
          ),
          Expanded(
            //flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.white, width: 20.0),
                ),
                child: TextButton(
                  onPressed: () {
                    print('corba butonu tiklandi');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('yemekresmi/tatli_$tatliNo.jpg'),
                      InkWell(
                        splashColor: Colors.pinkAccent,
                        onTap: () {
                          yemekleriYenile();

                          //setState(() {
                          //tatliNo = Random().nextInt(5) + 1;
                          // yemekNo = Random().nextInt(5) + 1;
                          //corbaNo = Random().nextInt(5) + 1;
                          // tatliNo = Random().nextInt(5) + 1;
                          //  });
                          //tatliNo = 5;
                          print('tiklanan tatli numarasi: $tatliNo');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text(
            //ucuncu yemegin metinsel bilgileri icin
            tatliAdlari[tatliNo - 1],
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          Container(
            //divider cizgisini yazının ortasında degil de ustune getirmek icin yaptik
            width: 200,
            child: Divider(
              height: 6,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
