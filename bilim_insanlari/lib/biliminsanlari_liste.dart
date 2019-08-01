import 'package:bilim_insanlari/models/kisi.dart';
import 'package:flutter/material.dart';

import 'utils/strings.dart';

class BilimInsanlariListesi extends StatelessWidget {
  static List<Kisi> tumKisiler = veriKaynaginiHazirla();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilim İnsanları"),
      ),
      body: listeyiHazirla(),
    );
  }

  static List<Kisi> veriKaynaginiHazirla() {
    List<Kisi> kisiler = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.KISI_RESIM_ADLARI[i]+"_kucuk.jpg";
      String buyukResim = Strings.KISI_RESIM_ADLARI[i]+".jpg";

      Kisi eklenecekKisi = Kisi(Strings.KISI_ADLARI[i], Strings.KISI_TARIH[i],
          Strings.KISI_GENEL_OZELLIKLERI[i], kucukResim, buyukResim);
      kisiler.add(eklenecekKisi);
    }
    return kisiler;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
        itemCount: tumKisiler.length,
        itemBuilder: (BuildContext context, int index) {
          return tekSatirKisi(context, index);
        });
  }

  Widget tekSatirKisi(BuildContext context, int index) {
    Kisi oanListeyeEklenenKisi = tumKisiler[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: ()=>Navigator.pushNamed(context, "/kisiDetay/$index"),
          leading: Image.asset(
            "images/" + oanListeyeEklenenKisi.kisiKucukResim,
            height: 64,
            width: 63,
          ),
          title: Text(
          oanListeyeEklenenKisi.kisiAdi,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.pink.shade500),
        ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              oanListeyeEklenenKisi.kisiTarihi,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios,color: Colors.pink),
        ),
      ),
    );
  }
}
