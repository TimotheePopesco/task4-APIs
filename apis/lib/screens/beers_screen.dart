import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apis/models.dart/beers_model.dart';

class BeersScreen extends StatefulWidget {
  const BeersScreen({super.key, this.title = '', this.apiLink = ''});
  final String title;
  final String apiLink;
  @override
  State<BeersScreen> createState() => _BeersScreenState();
}

class _BeersScreenState extends State<BeersScreen> {
  bool _isLoading = false;

  List<beers>? beersInfo = [];

  @override
  void initState() {
    super.initState();
    _callApi(widget.apiLink);
  }

  _callApi(apiLink) async {
    try {
      setState(() {
        _isLoading = true;
      });
      http.Response response = await http.get(Uri.parse(widget.apiLink));
      Iterable l = json.decode(response.body);
      beersInfo = List<beers>.from(
          l.map((model) => beers.fromJson(model)));
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
   ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${beersInfo![index].name}' '-' '${beersInfo![index].price}'),
                    leading: Image.network('${beersInfo![index].image}',fit: BoxFit.contain),
                  );
                }));
  }
}
