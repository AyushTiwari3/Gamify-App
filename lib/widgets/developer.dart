import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:gamify/models/details.dart';
import 'package:http/http.dart' as http;

class Raceing extends StatefulWidget {
  const Raceing({super.key});

  @override
  State<Raceing> createState() => _RaceingState();
}

class _RaceingState extends State<Raceing> {
  List<PostModal> devList = [];

  Future<List<PostModal>> getPostApi() async {
    final response = await http.get(
      Uri.parse('https://www.freetogame.com/api/games?category=racing'),
    );

    var data = jsonDecode(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        devList.add(PostModal.fromJson(i));
      }
      return devList;
    } else {
      return devList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 500.0,
          height: 350.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 250.0,
              itemCount: devList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(devList[index].thumbnail.toString()),
                      ),
                    ),
                    child: ListTile(
                        titleTextStyle:
                            GoogleFonts.anton(color: Colors.white, fontSize: 20),
                        title: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 295, 0, 0),
                          child: Text(
                            devList[index].developer.toString(),
                            textAlign: TextAlign.center,
                            
                          ),
                        ),
                        onTap: () {}),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
