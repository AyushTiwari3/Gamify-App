import 'package:flutter/material.dart';
import 'package:gamify/screens/nav.dart';

import 'package:transparent_image/transparent_image.dart';


class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        children: [
          SafeArea(
            child: FadeInImage(placeholder: MemoryImage(kTransparentImage),
              image:
                  const NetworkImage("https://wallpaperaccess.com/full/1657033.jpg"),),),
                  Image.asset("/Users/Asus/Desktop/flutter_projects/gamify/lib/assets/Gamify-1-removebg-preview.png",),
                  ElevatedButton(onPressed: (){
                     Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const BottomNav(),
      ),);
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[900],
                    ),
                   child: const Padding(
                     padding:  EdgeInsets.fromLTRB(50,15,50,15),
                     child: Text('Guest Login',
                     style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                   ))
                  
        ],
      ),
    );
  }
}
