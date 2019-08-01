import 'package:bilim_insanlari/models/kisi.dart';
import 'package:bilim_insanlari/testdeneme.dart';
import 'package:flutter/material.dart';

import 'biliminsanlari_liste.dart';
import 'kisi_detay.dart';


void main()=>runApp(MyApps());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bilim İnsanları",

      initialRoute: "/bilimInsanlariListesi",
      routes: {
        "/" : (context)=>BilimInsanlariListesi(),
        "/bilimInsanlariListesi " : (context)=>BilimInsanlariListesi(),


      },
      onGenerateRoute: (RouteSettings settings){
        List<String> pathElemanlari = settings.name.split("/");
        if(pathElemanlari[1]=="kisiDetay"){
          return MaterialPageRoute(builder: (context)=>KisiDetay(int.parse(pathElemanlari[2])));
        }

        return null;
      },

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),

    );
  }
}
