import 'package:flutter/material.dart';
import 'package:pokedex_untar_535190033/pokemon.dart';


///THIS CONTAIN DETAIL OF EVERY POKEMON
class DetailPage extends StatelessWidget {
  Pokemon pokemon;

  Color bgColor = Color(0xFF171515);
  DetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:bgColor,
      appBar: AppBar(
        title: Text("Pokedex"),
        backgroundColor: _setColor(pokemon),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Return to list",
          onPressed: (){
            Navigator.pop(context,true);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: pokemon == null ?  Center(child: Text('NaN'),) : Center(child: Text('#0${pokemon.id.toString()}',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.white
              ),
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
                    color: _setColor(pokemon),
                    borderRadius: BorderRadiusDirectional.vertical(top: Radius.zero,bottom: Radius.circular(50))
                ),
              ),

              Positioned(
                child: CircleAvatar(radius: 100,
                  backgroundColor: Colors.white54,
                  backgroundImage:NetworkImage(pokemon.sprites.frontDefault),
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          Text(pokemon.name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 40,
                color: Colors.white,
                letterSpacing: 3
            ),
          ),

          SizedBox(height: 10,),
          Expanded(
            flex: -1,
            child: Container(
              height: 120,
              child: ListView.builder(
                  itemCount: pokemon.types.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 120,vertical: 8),
                      child: Text(pokemon.types[index].type.name,style: TextStyle(color: Colors.white,fontSize: 15,     letterSpacing: 2),),
                      decoration: BoxDecoration(
                          color: _setColor(pokemon),
                          borderRadius: BorderRadius.circular(30)),
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
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,)
                  ),
                  Text('Weight',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white70,)
                  ),
                ],
              ),
              Column(
                children: [
                  Text('${pokemon.height/10} M',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,)
                  ),
                  Text('Height',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white70,)
                  ),
                ],
              ),

            ],
          ),
          SizedBox(height: 12,),
          Text("Base Stats",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: Colors.white,
                decoration: TextDecoration.underline,
                letterSpacing: 2
            ),
          ),
          SizedBox(height: 12,),
          Expanded(
            child: ListView.builder(
                itemCount: pokemon.stats.length,
                itemBuilder: (context,index){
                  final poke = pokemon.stats[index];

                  return Column(
                    children: [
                      Text('${poke.stat.name} = ${poke.baseStat}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: 1

                        ),
                      ),
                      SizedBox(height: 3,)
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

_setColor(Pokemon pokemon){
  Color defaultColor = Colors.blueGrey;
  Color blue = Color(0xFF2A9CE0);
  Color lightblue = Color(0xFF3FB8B8);
  Color red = Color(0xB3FF6F6F);
  Color green = Color(0xB383FF74);
  Color grey = Color(0xB3485C54);
  Color purple = Color(0xB3D32BDC);
  Color yellow = Color(0xB3FCBC3A);
  Color earth = Colors.brown;
  Color fairy = Color(0xCBE872A7);
  Color orange = Color(0xCBEA740A);
  Color brownDark = Color(0xCB44372D);
  Color greyDark = Color(0xCB474545);
  Color dragon = Color(0xCBAD084E);
  Color pokeColor;

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
        pokeColor = yellow;
      }
      if(pokemon.types[i].type.name =="normal"){
        pokeColor = grey;
      }
      if(pokemon.types[i].type.name =="poison"){
        pokeColor = purple;
      }
      if(pokemon.types[i].type.name =="electric"){
        pokeColor = lightblue;
      }
      if(pokemon.types[i].type.name =="ground"){
        pokeColor = earth;
      }
      if(pokemon.types[i].type.name =="fairy"){
        pokeColor = fairy;
      }
      if(pokemon.types[i].type.name =="fighting"){
        pokeColor = orange;
      }
      if(pokemon.types[i].type.name =="psychic"){
        pokeColor = brownDark;
      }
      if(pokemon.types[i].type.name =="rock"){
        pokeColor = greyDark;
      }
      if(pokemon.types[i].type.name =="ghost"){
        pokeColor = purple;
      }
      if(pokemon.types[i].type.name =="ice"){
        pokeColor = blue;
      }
      if(pokemon.types[i].type.name =="dragon"){
        pokeColor = dragon;
      }

      return pokeColor;
    }
  }
  return defaultColor;
}