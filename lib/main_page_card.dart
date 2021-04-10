import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokedex_untar_535190033/pokemon_api.dart';
import 'package:pokedex_untar_535190033/card_info.dart';
import 'package:pokedex_untar_535190033/color_picker.dart';

class PokeCard extends StatefulWidget {

  const PokeCard({Key key , this.pokeURLs}) : super(key: key);
  final String pokeURLs;


  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  Pokemon pokemon;

  _fetchData() async{
    final response = await http.get(widget.pokeURLs);
    final decode = json.decode(response.body);
    final data = Pokemon.fromJson(decode);

    setState(() {
      pokemon = data;


    });
  }




  void initState(){
    _fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      child:  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            color: ColorPicker().setColor(pokemon),
            child: InkWell(
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailPage(pokemon)));
              },
              child: pokemon == null ? Center(
                child: CircularProgressIndicator(),
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Image.network(pokemon.sprites.frontDefault,
                    width: 130,
                    fit: BoxFit.fill,

                  ),

                  Text(pokemon.name.toUpperCase(),
                    style: GoogleFonts.londrinaShadow(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.bold),

                  ),
                ],
              ),

            )
          ),
      );
  }


}




