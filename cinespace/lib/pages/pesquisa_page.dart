import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PesquisaPage extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Procurar filmes/series';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }

  Future<List> sugestoes() async {
    var url = Uri.parse('htts://www.themoviedb.org/movie?search=$query');
    Map<String, String> headers = {
      'Authorization': '1d9a3b2956d60bfebc1a8a6420c20bb0',
    };
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body).map((escolha) => escolha).toList();
    }
    throw Exception("erro");
  }
}
