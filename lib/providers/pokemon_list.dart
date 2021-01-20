import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonList with ChangeNotifier {
  List<String> _listOfPokemon = [];

  List<String> get listOfPokemon {
    return [..._listOfPokemon];
  }

  Future<void> fetchAndSetPokemonNames() async {
    const url = 'https://pokeapi.co/api/v2/pokemon?limit=20';
    final response = await http.get(url);

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData['results'] != null) {
      extractedData['results'].forEach((v) {
        _listOfPokemon.add(v["name"]);
      });
    }
    notifyListeners();
  }
}

class Results {
  String name;
  String url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
