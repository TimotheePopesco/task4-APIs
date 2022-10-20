import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apis/models.dart/beers_ale_model.dart';

class BeersScreen extends StatefulWidget {
  const BeersScreen({super.key, this.title = '', this.apiLink = ''});
  final String title;
  final String apiLink;
  @override
  State<BeersScreen> createState() => _BeersScreenState();
}

class _BeersScreenState extends State<BeersScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _callApi(widget.apiLink);
  }

  List<beers>? BeersHistoryList = [];
  // List<Rating>? RatingList = [];
  _callApi(apiLink) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var url = Uri.parse(widget.apiLink);
      http.Response response = await http.get(url);

      Iterable I = json.decode(response.body);

      BeersHistoryList =
          List<beers>.from(I.map((model) => beers.fromJson(model)));
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
                itemCount: BeersHistoryList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    color: Color.fromARGB(255, 176, 168, 168),
                    child: Column(children: [
                      Text('${BeersHistoryList![index].name}'),
                      // Image.network('${BeersHistoryList![index].image}'),
                      Text('${BeersHistoryList![index].rating!.average}'),
                      Text('${BeersHistoryList![index].rating!.reviews}'),
                    ]),
                  );
                }));
  }
}
