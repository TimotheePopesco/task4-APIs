import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apis/models.dart/recipes_model.dart';
import 'package:url_launcher/url_launcher.dart';

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

  List<recipess>? RecipesHistoryList = [];
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
          List<recipess>.from(I.map((model) => recipess.fromJson(model)));
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
                    color: Color.fromARGB(125, 10, 10, 120),
                    

                    child: Column(children: [
                      Text('${RecipesHistoryList![index].title}',
                      ),
                      
                      Text('${RecipesHistoryList![index].course} - ${RecipesHistoryList![index].cuisine} - ${RecipesHistoryList![index].mainIngredient} - ${RecipesHistoryList![index].tags}\n\n'),
                      Image.network('${RecipesHistoryList![index].photoUrl}'),
                      Text('${RecipesHistoryList![index].description}\n\n'),
                      Text('PrepTime : ${RecipesHistoryList![index].prepTime} - CookTime : ${RecipesHistoryList![index].cookTime} - TotalTime : ${RecipesHistoryList![index].totalTime} - Servings : ${RecipesHistoryList![index].servings}\n\n'),
                      Text('${RecipesHistoryList![index].ingredients}\n\n'),
                      Text('${RecipesHistoryList![index].directions}\n\n'),
                      Text('link for the website of the recipe : ${RecipesHistoryList![index].source}'),
                      
                    ]),
                  );
                }));
  }
}
