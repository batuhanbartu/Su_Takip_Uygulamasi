import 'package:flutter/material.dart';

class SuTuketimKaydi extends StatefulWidget {
  @override
  _SuTuketimKaydiState createState() => _SuTuketimKaydiState();
}

class _SuTuketimKaydiState extends State<SuTuketimKaydi> {
  List<int> suMiktarlari = []; // Su miktarlarının tutulacağı liste

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Su Tüketim Kaydı'), // Sayfa başlığı
      ),
      body: ListView.builder(
        itemCount: suMiktarlari.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${index + 1}. Gün Su Tüketimi: ${suMiktarlari[index]} ml'), // Liste öğeleri
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Su miktarı ekleme dialogunu göster
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Su Miktarı Ekle'), // Dialog başlığı
                content: TextField(
                  keyboardType: TextInputType.number, // Sadece sayı girişi kabul edilir
                  onChanged: (value) {
                    setState(() {
                      suMiktarlari.add(int.parse(value)); // Listeye su miktarını ekle
                    });
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Dialogu kapat
                    },
                    child: Text('Kapat'), // Kapat butonu
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add), // Ekleme butonu
      ),
    );
  }
}
