import 'package:flutter/material.dart';
import 'package:gamify/models/details.dart';
import 'package:gamify/models/dev.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

//ignore: must_be_immutable
class GameDetails extends StatefulWidget {
  GameDetails({super.key, required this.index, required this.postList,required this.devList});
  List<PostModal> postList = [];
  List<DevDet> devList = [];
  var index;

  @override
  State<GameDetails> createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  _launchURL() async {
    Uri _url = Uri.parse(widget.postList[widget.index].gameUrl.toString());
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.postList[widget.index].title.toString(),
          style: GoogleFonts.anton(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                widget.postList[widget.index].thumbnail.toString()),
            fit: BoxFit.cover,
            opacity: .4,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.postList[widget.index].thumbnail.toString(),
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Genre: ',
                style: GoogleFonts.anton(color: Colors.green, fontSize: 25),
              ),
              Text(
                (widget.postList[widget.index].genre.toString()),
                style: GoogleFonts.anton(color: Colors.white, fontSize: 20),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Platform: ',
                  style: GoogleFonts.anton(color: Colors.green, fontSize: 25),
                ),
                Text(
                  (widget.postList[widget.index].platform.toString()),
                  style: GoogleFonts.anton(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Publisher: ',
                  style: GoogleFonts.anton(color: Colors.green, fontSize: 25),
                ),
                Text(
                  (widget.postList[widget.index].publisher.toString()),
                  style: GoogleFonts.anton(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Developer: ',
                  style: GoogleFonts.anton(color: Colors.green, fontSize: 25),
                ),
                Text(
                  (widget.postList[widget.index].developer.toString()),
                  style: GoogleFonts.anton(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Release Date: ',
                  style: GoogleFonts.anton(color: Colors.green, fontSize: 25),
                ),
                Text(
                  (widget.postList[widget.index].releaseDate.toString()),
                  style: GoogleFonts.anton(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Discription',
              style: GoogleFonts.anton(
                color: Colors.red,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.postList[widget.index].shortDescription.toString(),
                style: GoogleFonts.anton(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Game Url: ',
                      style:
                          GoogleFonts.anton(color: Colors.white, fontSize: 20)),
                ),
                Expanded(
                    child: InkWell(
                  onTap: _launchURL,
                  child: Text(widget.postList[widget.index].gameUrl.toString(),
                      style:
                          GoogleFonts.anton(color: Colors.blue, fontSize: 15)),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
