import 'package:flutter/material.dart';
import 'package:apis/my_two_apis.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: links.length,
          itemBuilder: (context, index) {
            return Card(
              color: Color.fromARGB(80, 20, 20, 180),
              elevation: 10,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => links[index].screen));
                },
                title: Text(links[index].title),
                subtitle: Text(links[index].link),
              ),
            );
          }),
    );
  }
}
