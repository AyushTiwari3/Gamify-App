import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gamify/models/details.dart';
import 'package:gamify/models/dev.dart';
import 'package:gamify/widgets/mob_game_details.dart';
import 'package:gamify/widgets/pc_game_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomeMobScreen extends StatefulWidget {
  const HomeMobScreen({super.key});

  @override
  State<HomeMobScreen> createState() => _HomeMobScreenState();
}

class _HomeMobScreenState extends State<HomeMobScreen> {
  List<PostModal> mobList = [];

  Future<List<PostModal>> getPostApi() async {
    final response = await http.get(
      Uri.parse('https://api.npoint.io/870c662b4bbe98ff3ac4'),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        mobList.add(PostModal.fromJson(i));
      }
      return mobList;
    } else {
      return mobList;
    }
  }

  List<DevDet> devMobList = [];

  Future<List<DevDet>> getPostApiThree() async {
    final response = await http.get(
      Uri.parse('https://api.npoint.io/b6b49e58b26408314b15'),
    );

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        devMobList.add(DevDet.fromJson(i));
      }
      return devMobList;
    } else {
      return devMobList;
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
              height: 480,
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
                                              height: 370.0,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemExtent: 290.0,
                                                  itemCount: mobList.length,
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
                                                                mobList[index]
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
                                                                    mobList[index]
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
                                                                        mobList,
                                                                    devList:
                                                                        devMobList,
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
                                itemCount: devMobList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: NetworkImage(devMobList[index]
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
                                              devMobList[index].name.toString(),
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
                                                      DeveloperMobDetails(
                                                        index: index,
                                                        devMobList: devMobList,
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
