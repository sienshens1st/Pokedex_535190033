import 'package:flutter/material.dart';
import 'package:pokedex_untar_535190033/pokemon_api.dart';

class ColorPicker{

  Color defaultColor = Colors.greenAccent;
  Color pokemonTanah = Colors.brown;
  Color fairy = Color(0xCBE872A7);
  Color orange = Color(0xCBEA740A);
  Color blue = Color(0xFF2083BF);
  Color lightblue = Color(0xFF3FB8B8);
  Color red = Color(0xB3F15353);
  Color green = Color(0xB354E243);
  Color grey = Color(0xB3485C54);
  Color teal = Color(0xFF90DC92);
  Color purple = Color(0xB3BE2CC6);
  Color yellow = Color(0xB3FCBC3A);
  Color brownDark = Color(0xCB44372D);
  Color darkGrey = Color(0xCB474545);
  Color fightingColor = Color(0xB37F0317);
  Color pokeColor;

   setColor(Pokemon pokemon){

    if(pokemon!=null){
      for(int i =0;i<pokemon.types.length;i++){
        if(pokemon.types[i].type.name =="water"){
          pokeColor = blue;
        }
        if(pokemon.types[i].type.name =="fire"){
          pokeColor = red;
        }
        if(pokemon.types[i].type.name =="grass"){
          pokeColor = green;
        }
        if(pokemon.types[i].type.name =="bug"){
          pokeColor = darkGrey;
        }
        if(pokemon.types[i].type.name =="normal"){
          pokeColor = teal;
        }
        if(pokemon.types[i].type.name =="poison"){
          pokeColor = purple;
        }
        if(pokemon.types[i].type.name =="fairy"){
          pokeColor = fairy;
        }
        if(pokemon.types[i].type.name =="fighting"){
          pokeColor = fightingColor;
        }
        if(pokemon.types[i].type.name =="psychic"){
          pokeColor = grey;
        }
        if(pokemon.types[i].type.name =="rock"){
          pokeColor = darkGrey;
        }
        if(pokemon.types[i].type.name =="ghost"){
          pokeColor = brownDark;
        }
        if(pokemon.types[i].type.name =="ice"){
          pokeColor = blue;
        }
        if(pokemon.types[i].type.name =="dragon"){
          pokeColor = orange;
        }
        if(pokemon.types[i].type.name =="electric"){
          pokeColor = lightblue;
        }
        if(pokemon.types[i].type.name =="ground"){
          pokeColor = pokemonTanah;
        }
        return pokeColor;
      }
    }
    return defaultColor;
  }


}
