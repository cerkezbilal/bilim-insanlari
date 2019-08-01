import 'package:bilim_insanlari/biliminsanlari_liste.dart';
import 'package:bilim_insanlari/models/kisi.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';


class KisiDetay extends StatefulWidget {
  int gelenIndex;

  KisiDetay(this.gelenIndex);

  @override
  _KisiDetayState createState() => _KisiDetayState();
}

class _KisiDetayState extends State<KisiDetay> {
  Kisi secilenKisi;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {

    super.initState();
    secilenKisi = BilimInsanlariListesi.tumKisiler[widget.gelenIndex];
    baskinRenkBul();
  }

  void baskinRenkBul(){

    Future<PaletteGenerator>fPaletteGenerator = PaletteGenerator.fromImageProvider(AssetImage
      ("images/"+secilenKisi
        .kisiBuyukResim));

    fPaletteGenerator.then((value){

      paletteGenerator = value;
      debugPrint("secilen renk : " +paletteGenerator.dominantColor.color
          .toString());


      setState(() {

        baskinRenk = paletteGenerator.dominantColor.color;

      });
    });
  }

  @override
  Widget build(BuildContext context) {








    return Scaffold(
      primary: true,
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: baskinRenk != null ? baskinRenk: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+secilenKisi.kisiBuyukResim,fit: BoxFit.cover,),
              centerTitle: true,
              title: Text(secilenKisi.kisiAdi+" Hayatı"),
            ),

          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: SingleChildScrollView(
                  child: Text(secilenKisi.kisiDetay, style: TextStyle(fontSize:
                  18, color: Colors.black),),
                ),
            ),
            ),

        ],
      ),
    );
  }
}
