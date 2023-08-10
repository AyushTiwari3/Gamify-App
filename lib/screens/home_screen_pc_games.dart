import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gamify/models/details.dart';
import 'package:gamify/models/dev.dart';
import 'package:gamify/widgets/developer_details.dart';
import 'package:gamify/widgets/pc_game_details.dart';
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

  List<PostModal> raceList = [];

  Future<List<PostModal>> getPostApiTwo() async {
    final response = await http.get(
      Uri.parse('https://www.freetogame.com/api/games?category=racing'),
    );

    var data = jsonDecode(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        raceList.add(PostModal.fromJson(i));
      }
      return raceList;
    } else {
      return raceList;
    }
  }

  List<DevDet> devList = [];

  Future<List<DevDet>> getPostApiThree() async {
    final response = await http.get(
      Uri.parse('https://api.npoint.io/eddff7a81fd7543a3e6b'),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        devList.add(DevDet.fromJson(i));
      }
      return devList;
    } else {
      return devList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450,
              child: Expanded(
                child: Column(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
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
                                              height: 360.0,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemExtent: 270.0,
                                                  itemCount: postList.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                postList[index]
                                                                    .thumbnail
                                                                    .toString()),
                                                          ),
                                                        ),
                                                        child: ListTile(
                                                            titleTextStyle:
                                                                GoogleFonts.anton(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                            title: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      0,
                                                                      295,
                                                                      0,
                                                                      0),
                                                              child: Expanded(
                                                                child: SizedBox(
                                                                  height: 100,
                                                                  child: Text(
                                                                    postList[
                                                                            index]
                                                                        .title
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            onTap: () {
                                                              Navigator.of(
                                                                context,
                                                              ).push(
                                                                MaterialPageRoute(
                                                                  builder: (
                                                                    ctx,
                                                                  ) =>
                                                                      GameDetails(
                                                                    index:
                                                                        index,
                                                                    postList:
                                                                        postList,
                                                                    devList:
                                                                        devList,
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ]);
                                    }
                                  })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: getPostApiTwo(),
              builder: (context_1, snapshot_1) {
                if (!snapshot_1.hasData) {
                  return const Text('Loading');
                } else {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'All Time Racing Hits',
                              style: GoogleFonts.anton(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500.0,
                          height: 370.0,
                          child: Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemExtent: 270.0,
                                itemCount: raceList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(raceList[index]
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
                                              raceList[index].title.toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(
                                              context,
                                            ).push(
                                              MaterialPageRoute(
                                                builder: (
                                                  ctx,
                                                ) =>
                                                    GameDetails(
                                                  index: index,
                                                  postList: raceList,
                                                  devList: devList,
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ]);
                }
              },
            ),
            FutureBuilder(
              future: getPostApiThree(),
              builder: (context_2, snapshot_2) {
                if (!snapshot_2.hasData) {
                  return const Text('Loading');
                } else {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Top Developers',
                              style: GoogleFonts.anton(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500.0,
                          height: 370.0,
                          child: Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemExtent: 250.0,
                                itemCount: devList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(devList[index]
                                              .imageBackground
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
                                              devList[index].name.toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(
                                              context,
                                            ).push(
                                              MaterialPageRoute(
                                                  builder: (
                                                ctx,
                                              ) =>
                                                      DeveloperDetails(
                                                        index: index,
                                                        devList: devList,
                                                      )),
                                            );
                                          }),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ]);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
