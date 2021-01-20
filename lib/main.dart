import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_list.dart';
import 'package:pokedex/screens/pokemon_grid_screen.dart';
import 'package:provider/provider.dart';

import './styles/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => PokemonList(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: PokeColors.red,
            accentColor: PokeColors.blue,
          ),
          home: PokemonGridView()),
    );
  }
}
