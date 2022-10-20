import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apis/models.dart/recipes_model.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key, this.title = '', this.apiLink = ''});
  final String title;
  final String apiLink;
  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _callApi(widget.apiLink);
  }

  List<recipes>? RecipesHistoryList = [];
  // List<Rating>? RatingList = [];
  _callApi(apiLink) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var url = Uri.parse(widget.apiLink);
      http.Response response = await http.get(url);

      Iterable I = json.decode(response.body);

      RecipesHistoryList =
          List<recipes>.from(I.map((model) => recipes.fromJson(model)));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: RecipesHistoryList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    color: Color.fromARGB(255, 176, 168, 168),
                    child: Column(children: [
                      Text('${RecipesHistoryList![index].title}'),
                      // Image.network('${BeersHistoryList![index].image}'),
                      Text('${RecipesHistoryList![index].description}'),
                      Text('${RecipesHistoryList![index].cuisine}'),
                    ]),
                  );
                }));
  }
}
