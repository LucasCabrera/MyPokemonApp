import 'dart:ui';
import 'package:com/pokemon.dart';
import 'package:com/pokemonDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() =>
    runApp
      (MaterialApp
        (
        title: "Poke App",
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        )
      );

class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  var url = "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json";

  PokeHub pokeHub;

  @override
  void initState()
  {
    super.initState();
    fetchData();
  }

  fetchData() async
  {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("Poke App"),
            centerTitle: true,
            backgroundColor: Colors.red,
          ),
          body: pokeHub == null?
              Center( child: CircularProgressIndicator(),
              )
              : GridView.count(
            crossAxisCount: 2,
            children: pokeHub.pokemon.map((poke) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PokemonDetail(
                      pokemon: poke,
                    )
                  ));
                },
                child: Hero(
                  tag: poke.img,
                  child: Card(
                    color: Colors.redAccent,
                    elevation: 3.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(poke.img))),
                        ),
                        Text(
                          poke.name,
                          style: TextStyle(
                            fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
               ) ,
              )
            )
          ).toList(),
        ),
        drawer: Drawer(),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {},
//          backgroundColor: Colors.red,
//          child: Icon(Icons.refresh),
//        ),
    );
  }
}
