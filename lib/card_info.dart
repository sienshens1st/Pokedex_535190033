import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_untar_535190033/pokemon_api.dart';
import 'package:pokedex_untar_535190033/color_picker.dart';


///Pokemon Card Detail
class DetailPage extends StatelessWidget {
  Pokemon pokemon;


  Color bgColor = Color(0xFF2D2425);
  DetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:bgColor,
      appBar: AppBar(
        title: Text("PokedeX",
          style: GoogleFonts.londrinaShadow(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorPicker().setColor(pokemon),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          tooltip: "Back",
          onPressed: (){
            Navigator.pop(context,true);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: pokemon == null ?  Center(child: Text('NaN'),) : Center(child: Text('#0${pokemon.id.toString()}',
              style: GoogleFonts.londrinaShadow(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),
            )),
          )
        ],

      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                decoration:BoxDecoration(
                    color: ColorPicker().setColor(pokemon),
                    borderRadius: BorderRadiusDirectional.vertical(top: Radius.zero,bottom: Radius.circular(50)),
                  image: new DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(pokemon.sprites.frontDefault)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(pokemon.name.toUpperCase(),
            style: GoogleFonts.londrinaShadow(fontSize: 30.0,color: Colors.white,letterSpacing: 3,fontWeight: FontWeight.bold),
          ),


          //MASALAH
          SizedBox(height: 10,),
          Expanded(
            flex: -1,
            child: Container(
                  height: 100,
                  child: ListView.builder(
                      itemCount: pokemon.types.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(horizontal:60,vertical: 4),
                              child: Text(pokemon.types[index].type.name.toUpperCase(),
                                  style: GoogleFonts.londrinaShadow(fontSize: 20.0,color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.w800)),
                              decoration: BoxDecoration(
                                color: ColorPicker().setColor(pokemon),
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),

                          ],
                        );
                      }),
                ),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('${pokemon.weight/10} KG',
                    style: GoogleFonts.londrinaShadow(fontSize: 20.0,color: Colors.white,letterSpacing: 3,fontWeight: FontWeight.bold),
                  ),
                  Text('WEIGHT',
                    style: GoogleFonts.londrinaShadow(fontSize: 20.0,color: Colors.white,letterSpacing: 3,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('${pokemon.height/10} M',
                    style: GoogleFonts.londrinaShadow(fontSize: 20.0,color: Colors.white,letterSpacing: 3,fontWeight: FontWeight.bold),
                  ),
                  Text('HEIGHT',
                    style: GoogleFonts.londrinaShadow(fontSize: 20.0,color: Colors.white,letterSpacing: 3,fontWeight: FontWeight.bold),
                  ),
                ],
              ),

            ],
          ),
          SizedBox(height: 12,),
          Text("BASE STATS",
            style: GoogleFonts.londrinaShadow(fontSize: 25,color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12,),

          Expanded(
            child: ListView.builder(
                itemCount: pokemon.stats.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                  final poke = pokemon.stats[index];
                  return Column(
                    children: [
                      Text('${poke.stat.name.toUpperCase()}',
                        style: GoogleFonts.londrinaShadow(fontSize: 18.0,color: Colors.white,letterSpacing: 1,fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: LinearProgressIndicator(

                            minHeight: 20,
                            value: poke.baseStat.toDouble()/130,
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(ColorPicker().setColor(pokemon))),
                      ),
                      SizedBox(height: 10)
                    ],
                  );
                }
            ),
          )




        ],
      ),

    );
  }
}
