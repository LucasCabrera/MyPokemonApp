import 'package:flutter/material.dart';
import 'package:com/pokemon.dart';
import 'package:flutter/widgets.dart';

class PokemonDetail extends StatelessWidget
{
  final Pokemon pokemon;

  PokemonDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.width * 0.1,
        child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 140.0,
              ),
              Text(pokemon.name,
                style: TextStyle(fontSize: 30.0,
                    fontWeight: FontWeight.bold),),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text("Types",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map((typeText) =>
                    FilterChip(backgroundColor: Colors.redAccent,
                        label: Text(typeText,
                            style: TextStyle(color: Colors.white)),
                        onSelected: (b) {}))
                .toList(),
              ),
              Text("Weakness",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.weaknesses.map((weaknessText) =>
                    FilterChip(backgroundColor: Colors.redAccent,
                        label: Text(weaknessText,
                            style: TextStyle(color: Colors.white)),
                        onSelected: (b) {}))
                .toList(),
              ),
              pokemon.prevEvolution != null?
              Text("Previus Evolution",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),):Text(""),
              pokemon.prevEvolution != null?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.prevEvolution.map((prevEvolutionText) =>
                    FilterChip(backgroundColor: Colors.redAccent,
                        label: Text(prevEvolutionText.name,
                            style: TextStyle(color: Colors.white)),
                        onSelected: (b) {}))
                .toList(),
              ):Text(""),
                pokemon.nextEvolution != null?
                Text("Next Evolution",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),):Text(""),
                pokemon.nextEvolution != null?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution.map((nextEvolutionText) =>
                      FilterChip(backgroundColor: Colors.redAccent,
                          label: Text(nextEvolutionText.name,
                              style: TextStyle(color: Colors.white)),
                          onSelected: (b) {}))
                  .toList(),
                ):Text(""),
            ],
          ),
        )
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(tag: pokemon.img, child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit:BoxFit.cover,
                image: NetworkImage(pokemon.img))
          ),
        ),),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}