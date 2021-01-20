import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonGridItem extends StatelessWidget {
  final String title;

  PokemonGridItem(this.title);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: GridTile(
        child: Card(
          color: Theme.of(context).accentColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
