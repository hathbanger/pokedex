import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_list.dart';
import 'package:pokedex/widgets/pokemon_grid_item.dart';
import 'package:provider/provider.dart';

class PokemonGridView extends StatefulWidget {
  @override
  _PokemonGridViewState createState() => _PokemonGridViewState();
}

class _PokemonGridViewState extends State<PokemonGridView> {
  var _loading = false;

  @override
  void initState() {
    setState(() {
      _loading = true;
    });
    Future.delayed(Duration.zero).then((value) {
      Provider.of<PokemonList>(context)
          .fetchAndSetPokemonNames()
          .then((response) {
        setState(() {
          _loading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listOfPokemon = Provider.of<PokemonList>(context).listOfPokemon;
    print(listOfPokemon.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("PokeDex"),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, i) => PokemonGridItem(listOfPokemon[i]),
              itemCount: listOfPokemon.length,
            ),
    );
  }
}
