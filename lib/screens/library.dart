import 'package:flutter/material.dart';
import 'package:reece/screens/nowplaying.dart';

import '../constants.dart';

class Library extends StatelessWidget {
  //Now we will create a template for Genre Card
  Widget genreCard(String img, String title, String foll) {
    return Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(gcard)),
        ),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 50,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$foll Streams',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
            )
          ],
        ));
  }

  //Now we will create a template for Song List
  Widget songsCard(
      int sr, String img, String title, String artist, String time) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("$sr"),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  artist,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                )
              ],
            ),
            Spacer(),
            Text(time),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEBF3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'POPULAR ALBUMS',
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ),
          ////Now we will create a Scroll views for different Genres
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                //Now we will call Genre card
                genreCard(pop, "From Me t..", '3,3587,903'),
                genreCard(hiphop, "Today's Tra..", '6,256,233'),
                genreCard(country, "And I'm O..", '2,367,605'),
                genreCard(heavymetal, "The Burn..", '1,117,310'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Text(
              'TRENDING TRACKS',
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ),
          //Container For Trending Songs
          Container(
            width: MediaQuery.of(context).size.width,
            height: 330,
            padding: EdgeInsets.fromLTRB(45, 30, 45, 25),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(scard)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  songsCard(1, art1, "Rio (feat. Flame)", "A-Reece", '3.11'),
                  songsCard(2, art2, "Holding Hands", "A-Reece", '2.15'),
                  songsCard(3, art3, "Paradise", "A-Reece", '3.52'),
                  songsCard(4, art4, "For My Sanity", "A-Reece", '3.02'),
                  songsCard(5, art5, "Intensions", "A-Reece", '2.59'),
                ],
              ),
            ),
          ),
          //Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                home,
                scale: 1.1,
              ),
              GestureDetector(
                child: Image.asset(
                  list,
                  scale: 1.1,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NowPlaying()),
                  );
                },
              ),
              Image.asset(
                podcast,
                scale: 1.1,
              ),
              Image.asset(
                search,
                scale: 1.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
