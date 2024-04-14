import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  // Günlük ve içilen su miktarlarını tutacak değişkenler
  double _gunlukSuMiktari = 0.0;
  double _icilenSuMiktari = 0.0;

  @override
  Widget build(BuildContext context) {
    // Argümanları al
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Kullanıcının adı, yaş bilgisi ve günlük su miktarı
    final String ad = args['ad'];
    final int yas = args['yas'];
    final double suMiktari = args['suMiktari'];

    // Günlük su miktarını ayarla
    _gunlukSuMiktari = suMiktari;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'), // Sayfa başlığı
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hoş Geldiniz, $ad!', // Kullanıcıya hoş geldiniz mesajı
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Yaşınız: $yas', // Kullanıcının yaş bilgisi
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Günlük İçilmesi Gereken Su Miktarı:', // Günlük su miktarı başlığı
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '$_gunlukSuMiktari ml', // Günlük su miktarı
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Bugün İçilen Su Miktarı:', // İçilen su miktarı başlığı
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '$_icilenSuMiktari ml', // İçilen su miktarı
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/suTuketimKaydi'); // Su tüketim kaydı sayfasına yönlendirme
              },
              child: Text('Su Tüketim Kaydı'), // Buton metni
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                suEkle(500); // Kullanıcı 500ml içti
              },
              child: Text('500ml İçildi'), // Buton metni
            ),
          ],
        ),
      ),
    );
  }

  // Su miktarını artıran fonksiyon
  void suEkle(double miktar) {
    setState(() {
      _icilenSuMiktari += miktar;
      _gunlukSuMiktari -= miktar;
    });
  }
}
