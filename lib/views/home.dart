import 'dart:convert';

import 'package:dogspath/models/path.dart';
import 'package:dogspath/utils/size_config.dart';
import 'package:dogspath/views/path_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Future<List<PathDetails>> fetchPaths() async {
    List<PathDetails> pathDetails = [];
    final client = http.Client();
    final request = await client.get(
      Uri.parse("https://5d55541936ad770014ccdf2d.mockapi.io/api/v1/paths"),
    );

    if (request.statusCode == 200) {
      List<dynamic> result = json.decode(request.body);
      pathDetails = result.map((e) => PathDetails.fromJson(e)).toList();
    } else {
      print("${request.statusCode}");
    }
    return pathDetails;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget title = Container(
      height: AppBar().preferredSize.height,
      alignment: Alignment.center,
      child: Text(
        "Dog's Path",
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: fetchPaths(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PathDetails> details = snapshot.data as List<PathDetails>;
              print(details);
              return Column(
                children: [
                  title,
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: details.length,
                      itemBuilder: (context, index) => PathView(
                        details: details[index],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ),
      ),
    );
  }
}
