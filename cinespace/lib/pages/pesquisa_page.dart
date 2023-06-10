import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';

import 'descricao.dart';
import 'home_page.dart';

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
}
