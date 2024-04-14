import 'package:flutter/material.dart';
import 'giris_sayfasi.dart'; // Giriş sayfasının dosyasını içe aktarıyoruz
import 'ana_sayfa.dart'; // Ana sayfa dosyasını içe aktarıyoruz
import 'su_tuketim_kaydi.dart'; // Su tüketim kaydı sayfasının dosyasını içe aktarıyoruz

void main() => runApp(SuTakipApp());

class SuTakipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Su Takip Uygulaması', // Uygulama başlığı
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema olarak mavi renk kullanıyoruz
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Başlangıç rotası
      routes: {
        '/': (context) => GirisSayfasi(), // '/' rotası için Giriş Sayfası'nı tanımlıyoruz
        '/anaSayfa': (context) => AnaSayfa(), // '/anaSayfa' rotası için Ana Sayfa'yı tanımlıyoruz
        '/suTuketimKaydi': (context) => SuTuketimKaydi(), // '/suTuketimKaydi' rotası için Su Tüketim Kaydı sayfasını tanımlıyoruz
      },
    );
  }
}
