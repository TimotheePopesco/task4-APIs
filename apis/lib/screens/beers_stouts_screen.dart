import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apis/models.dart/beers_stouts_model.dart';

class BeersstoutsScreen extends StatefulWidget {
  const BeersstoutsScreen({super.key, this.title = '', this.apiLink = ''});
  final String title;
  final String apiLink;
  @override
  State<BeersstoutsScreen> createState() => _BeersstoutsScreenState();
}

class _BeersstoutsScreenState extends State<BeersstoutsScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _callApi(widget.apiLink);
  }

  List<beersstouts>? BeersstoutsHistoryList = [];
  // List<Rating>? RatingList = [];
  _callApi(apiLink) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var url = Uri.parse(widget.apiLink);
      http.Response response = await http.get(url);

      Iterable I = json.decode(response.body);

      BeersstoutsHistoryList =
          List<beersstouts>.from(I.map((model) => beersstouts.fromJson(model)));
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
                itemCount: BeersstoutsHistoryList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    color: Color.fromARGB(255,242,142,28),
                    child: Column(children: [
                      Text('${BeersstoutsHistoryList![index].name} - ${BeersstoutsHistoryList![index].price}\n\n'),
                      Image.network('${BeersstoutsHistoryList![index].image}'),
                      
                      Text('Reviews ${BeersstoutsHistoryList![index].rating!.reviews} - ${BeersstoutsHistoryList![index].rating!.average}/5' ),
                    ]),
                  );
                }));
  }
}