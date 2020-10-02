import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';
import 'package:palette_generator/palette_generator.dart';

import 'burc_liste.dart';

class BurcDetay extends StatelessWidget {

  int gelenIndex;
  Burc secilenBurc;

  BurcDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListesi.tumBurclar[gelenIndex];

    Future<PaletteGenerator> fPaletGenerator = PaletteGenerator.fromImageProvider(AssetImage("images/" + secilenBurc.burcBuyukResim));
    PaletteGenerator paletteGenerator;
    fPaletGenerator.then((value) {
      paletteGenerator = value;
    });

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(8),
                  color: Colors.pink.shade100,
                  child: Text(
                    secilenBurc.burcDetayi,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                )),
          )
        ],
      ),
    );
  }


}
