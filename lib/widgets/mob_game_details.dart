import 'package:flutter/material.dart';
import 'package:gamify/models/dev.dart';
import 'package:google_fonts/google_fonts.dart';

//ignore: must_be_immutable
class DeveloperMobDetails extends StatefulWidget {
  DeveloperMobDetails(
      {super.key, required this.index, required this.devMobList});
  List<DevDet> devMobList = [];

  int index;

  @override
  State<DeveloperMobDetails> createState() => _DeveloperMobDetailsState();
}

class _DeveloperMobDetailsState extends State<DeveloperMobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.devMobList[widget.index].name.toString(),
          style: GoogleFonts.anton(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                widget.devMobList[widget.index].imageBackground.toString(),
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "About",
                  style: GoogleFonts.anton(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.devMobList[widget.index].about.toString(),
                    style:
                        GoogleFonts.anton(color: Colors.white, fontSize: 20)),
              ),
              Text(
                "Games Created",
                style: GoogleFonts.anton(color: Colors.red, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              for (var game in widget.devMobList[widget.index].games!)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    game.name.toString(),
                    style: GoogleFonts.anton(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
