import 'package:flutter/material.dart';
import 'package:gamify/screens/home_screen_mob_games.dart';
import 'package:gamify/screens/home_screen_pc_games.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        actions: [Image.asset("lib/assets/Gamify-1-removebg-preview.png")],
        centerTitle: true,
        title: Text(
          'GAMIFY',
          style: GoogleFonts.lilitaOne(
            color: Colors.purple[900],
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: IndexedStack(
        index: index,
        children: const [
          HomeScreen(),
          HomeMobScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int newindex) {
          setState(() {
            
            index = newindex;
          });
        },
        backgroundColor: Colors.purple[300],
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.gamepad_outlined),
            label: 'Pc/Console Games',
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