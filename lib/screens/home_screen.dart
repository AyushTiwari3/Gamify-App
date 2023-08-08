import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gamify/models/details.dart';
import 'package:gamify/widgets/game_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModal> postList = [];

  Future<List<PostModal>> getPostApi() async {
    final response = await http.get(
      Uri.parse('https://www.freetogame.com/api/games?'),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(PostModal.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          Image.asset(
              "/Users/Asus/Desktop/flutter_projects/gamify/lib/assets/Gamify-1-removebg-preview.png")
        ],
        centerTitle: true,
        title: Text(
          'GAMIFY',
          style: GoogleFonts.lilitaOne(
            color: Colors.purple[900],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Expanded(
                    child: FutureBuilder(
                        future: getPostApi(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Text('Loading');
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'All Time Hits',
                                      style: GoogleFonts.anton(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 500.0,
                                  height: 350.0,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemExtent: 250.0,
                                      itemCount: postList.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(postList[index]
                                                      .thumbnail
                                                      .toString()),
                                                ),
                                              ),
                                              child: Expanded(
                                                child: ListTile(
                                                    titleTextStyle: GoogleFonts.anton(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                    title: Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          0, 295, 0, 0),
                                                      child: Text(
                                                        postList[index].title.toString(),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(context,).push(
                                                          MaterialPageRoute(
                                                              builder: (ctx,) =>
                                                                   GameDetails(index: index,postList: postList,),),);
                                                    }),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                
                                
                                
              ]);
                          }
                        })),
              Expanded(
                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'All Time Hits',
                                        style: GoogleFonts.anton(
                                          color: Colors.white,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 500.0,
                                    height: 350.0,
                                    child: Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemExtent: 250.0,
                                          itemCount: postList.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(postList[index]
                                                        .thumbnail
                                                        .toString()),
                                                  ),
                                                ),
                                                child: ListTile(
                                                    titleTextStyle: GoogleFonts.anton(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                    title: Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          0, 295, 0, 0),
                                                      child: Text(
                                                        postList[index].title.toString(),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(context,).push(
                                                          MaterialPageRoute(
                                                              builder: (ctx,) =>
                                                                   GameDetails(index: index,postList: postList,),),);
                                                    }),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  
                                  
                                  
                ]),
              )],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple[300],
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.gamepad_outlined),
            label: 'Pc/Consoles Games',
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.mobile_screen_share_rounded),
              label: 'Mobile Games',
              backgroundColor: Colors.purple[900])
        ],
      ),
    );
  }
}
