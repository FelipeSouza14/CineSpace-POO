import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cinespace/classesmovie/cinema.dart';
import 'package:cinespace/pages/home_page.dart';

class PesquisaPage extends SearchDelegate<String> {
  List cinemamovies = [];

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
    List<String> matchQuery = [];

    for (var filme in cinemamovies) {
      if (filme.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(query);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(matchQuery[index]),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var filme in cinemamovies) {
      if (filme.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(filme);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(matchQuery[index]),
          );
        });
  }
}
