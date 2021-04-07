import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_untar_535190033/pokemon_api.dart';
import 'package:pokedex_untar_535190033/main_page_card.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  static const String url =  'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Pokemons pokemons;

  bool _isScrollToTopBtnVisible = false;
  //animating floating action
  AnimationController _animationController;
  ScrollController _scrollController  = ScrollController();

  Color bgColor = Color(0xFF5E0F0F);
  Future<List<Pokemons>> _fetchData() async{
   final response = await http.get(MyHomePage.url);
   final decode = json.decode(response.body);
   final data = Pokemons.fromJson(decode['results']);

   setState(() {
     pokemons = data;
   });

  }

  void initState(){
    _fetchData();
    super.initState();
    _scrollController.addListener(_scrollListener);
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1),reverseDuration: Duration(seconds: 1),);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
    print("dispose");
  }

  // give animation to scroll
  _scrollListener(){
    if(_scrollController.position.pixels >= 500){
      //start animation and show button
      _animationController.forward();
      setState(() {
        _isScrollToTopBtnVisible = true;
      });
    }else if (_scrollController.position.pixels<500){
      //hide the button
      _animationController.reverse();
      setState(() {
        _isScrollToTopBtnVisible = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("PokedeX",
        style: GoogleFonts.londrinaShadow(fontSize: 40.0),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search_rounded),tooltip: "Search Specific Pokemon", onPressed: (){
              showSearch(context: context, delegate: DataSearch(pokemons));
          })
        ],
      ),
      floatingActionButton:  Stack(
        children: <Widget>[
          if(_isScrollToTopBtnVisible)...{
            ScaleTransition(
              scale: CurvedAnimation(parent:_animationController,curve: Curves.fastOutSlowIn),
              child: FloatingActionButton(

                  tooltip: "Scroll to Top",
                  child: Icon(Icons.arrow_upward,color: Colors.white,),
                  backgroundColor: Colors.red,
                  hoverColor: Colors.redAccent,
                  onPressed: (){
                    _animationController.reverse();
                    _scrollController.animateTo(0, duration: Duration(milliseconds: 600), curve: Curves.fastOutSlowIn);
                  }),
            ),
          }
        ],
      ),
      body: Container(
            child:
            pokemons == null ?
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
                : GridView.count(
              //pass cotnroller to gridview
              controller: _scrollController,
              crossAxisCount: 2,
              children: List.generate(pokemons.pokemons.length,
                      (index) =>
                          PokeCard(
                    pokeURL: pokemons.pokemons[index].url,
                  )),
            ),

          ),


      );

  }
}

class DataSearch extends SearchDelegate<String> {

  Pokemons _pokemons;

  DataSearch(this._pokemons);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme =  Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.red,
    );
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return  query.isEmpty? Container(
       padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius:150,
                backgroundImage: AssetImage("tes7.gif"),
              ),
              SizedBox(height: 40),
              Text("Search Your Pokemon Here!",
                style: GoogleFonts.londrinaShadow(fontSize: 40.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ))
        : ListView.builder(
        itemCount: _pokemons.pokemons.length,
        itemBuilder: (context,index)=>
        _pokemons.pokemons[index].name.contains(query)?
            ListTile(
              title:  PokeCard(
                pokeURL: _pokemons.pokemons[index].url,
              )
          //if noone matches leave empty
            ) : Row(children: [],)
    );


  }


}
