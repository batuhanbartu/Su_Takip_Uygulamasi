import 'package:flutter/material.dart';

class GirisSayfasi extends StatelessWidget {
  // Text alanları için kontrolcüler
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _yasController = TextEditingController();
  final TextEditingController _boyController = TextEditingController();
  final TextEditingController _kiloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş'), // Sayfa başlığı
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Kullanıcıdan bilgileri almak için text alanları
            TextField(
              controller: _adController,
              decoration: InputDecoration(labelText: 'Adınız'),
            ),
            TextField(
              controller: _yasController,
              decoration: InputDecoration(labelText: 'Yaşınız'),
              keyboardType: TextInputType.number, // Sadece sayı girişi kabul edilir
            ),
            TextField(
              controller: _boyController,
              decoration: InputDecoration(labelText: 'Boyunuz (cm)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _kiloController,
              decoration: InputDecoration(labelText: 'Kilonuz (kg)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0), // Boşluk ekleyelim
            ElevatedButton(
              onPressed: () => _girisYap(context), // Giriş butonuna basıldığında _girisYap fonksiyonunu çağırır
              child: Text('Giriş Yap'), // Buton metni
            ),
            // Giriş sayfasının altına eklenen resim
            Image.asset(
              'lib/assets/image/su-giris-sayfasi-foto.jpeg', // Resim dosyasının yolu
              height: 350, // Resmin yüksekliği
              width: 350, // Resmin genişliği
              fit: BoxFit.contain, // Resmin boyutunu uygun şekilde ayarlar
            ),
          ],
        ),
      ),
    );
  }

  // Giriş yap butonuna basıldığında çalışacak fonksiyon
  void _girisYap(BuildContext context) {
    String ad = _adController.text; // Adı al
    int yas = int.tryParse(_yasController.text) ?? 0; // Yaşı al, eğer dönüştürme başarısız olursa varsayılan değer 0 olarak al
    int boy = int.tryParse(_boyController.text) ?? 0; // Boyu al
    int kilo = int.tryParse(_kiloController.text) ?? 0; // Kiloyu al

    double suMiktari = hesaplaSuMiktari(boy, kilo); // Su miktarını hesapla

    // Ana sayfaya yönlendirirken kullanılacak rotaya yönlendirme yapılırken argümanlar da gönderilir
    Navigator.pushNamed(
      context,
      '/anaSayfa',
      arguments: {
        'ad': ad, // Kullanıcının adı
        'yas': yas, // Kullanıcının yaş bilgisi
        'suMiktari': suMiktari, // Hesaplanan günlük su miktarı
      },
    );
  }

  // Günlük su miktarını hesaplayan fonksiyon
  double hesaplaSuMiktari(int boy, int kilo) {
    return (kilo * 30) + (boy * 10); // Boy ve kilo değerlerine göre su miktarını hesaplar ve döndürür
  }
}
