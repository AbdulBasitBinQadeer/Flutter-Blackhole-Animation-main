import 'package:counter_animation/card_hidden_animation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class BackScreen extends StatefulWidget {
  const BackScreen({super.key});

  @override
  State<BackScreen> createState() => _BackScreenState();
}

class _BackScreenState extends State<BackScreen> {
  double value = 0;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ Colors.white,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,
                  Colors.black,

                  Colors.white],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: 200,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/trt.jpg'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Abdul Basit',
                            style: GoogleFonts.bakbakOne(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 7),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildListTile(
                            index: 0,
                            icon: CupertinoIcons.house,
                            title: 'Home',
                          ),
                          SizedBox(height: 7),
                          _buildListTile(
                            index: 1,
                            icon: CupertinoIcons.person,
                            title: 'Profile',
                          ),
                          SizedBox(height: 7),
                          _buildListTile(
                            index: 2,
                            icon: CupertinoIcons.settings,
                            title: 'Settings',
                          ),
                          SizedBox(height: 7),
                          _buildListTile(
                            index: 3,
                            icon: CupertinoIcons.arrow_right_square,
                            title: 'Log out',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 4) * val),
                child: CardHiddenAnimationPage(),
              );
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }

  // Helper method to create a tappable ListTile with changing text and icon color
  Widget _buildListTile({required int index, required IconData icon, required String title}) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Color(0xFF47FF00) : Colors.white,
          size: 28,
        ),
        title: Text(
          title,
          style: GoogleFonts.bakbakOne(
            color: isSelected ? Color(0xFF47FF00) : Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
