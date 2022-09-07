import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:songapp/components/carrousel.dart';
import 'package:songapp/gameConfig.dart';
import 'package:songapp/global/colors.dart';
import 'package:songapp/services/api.dart';
import 'models/Playlists.dart';

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  List<Mock> predefinedListMixes = [
    Mock(mix: 'Metal Mix', image: 'assets/metal.png'),
    Mock(mix: 'Pop Mix', image: 'assets/pop.png'),
    Mock(mix: 'Rock Mix', image: 'assets/rock.png'),
    Mock(mix: 'R&B Mix', image: 'assets/rythm.png'),
    Mock(mix: 'Hip Hop Mix', image: 'assets/hiphop.png')
  ];

  List<Mock> predefinedFeaturedPlaylists = [
    Mock(mix: '70s Mix', image: 'assets/sabbath.png'),
    Mock(mix: '80s Mix', image: 'assets/bonjovi.png'),
    Mock(mix: '90s Mix', image: 'assets/pearljam.png'),
    Mock(mix: '2000s Mix', image: 'assets/green.png'),
    Mock(mix: '2010s Mix', image: 'assets/imagine.png')
  ];

  List<Mock> preDefinedArtistPlaylist = [
    Mock(mix: 'Olivia Rodrigo', image: 'assets/olivia.png'),
    Mock(mix: 'Drake', image: 'assets/drake.png'),
    Mock(mix: 'Katy Perry', image: 'assets/kay.png'),
    Mock(mix: 'Alok', image: 'assets/alok.png'),
    Mock(mix: 'Justin Bieber', image: 'assets/justin.png')
  ];
  List quantityMusics = [10, 12, 14, 16, 18];
  bool isLoaded = true;
  List nonNullableStr = [""];
  List<Artists>? playlists = [];
  var apiListMixes = [];
  List apiListFeatured = [];
  var apiListArtists = [];

  getData(String artistName) async {
    setState(() {
      isLoaded = false;
    });
    var token = (await SpotifyApiServices().fetchToken());
    var response =
        ((await SpotifyApiServices().fetchPlaylistsByName(token, artistName)));

    setState(() {
      isLoaded = true;
    });
    pushRedirect(response);
  }

  pushRedirect(var response) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return GameConfig(
            playListName: response[0].name,
            imageUrl: response[0].image,
            numberOfSongs: response[0].numberOfTracks,
            owner: response[0].owner);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: isLoaded
            ? ListView(children: [
                Column(children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 25),
                            child: Image.asset('assets/miniLogo.png',
                                width: 75, height: 75, fit: BoxFit.fill),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => {print("digitar...")},
                        child: Container(
                          padding: EdgeInsets.only(top: 20, left: 40),
                          child: Text(
                            "Choose a Playlist",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "Song, Artist, Album, Genres,Users, Etc",
                            style: TextStyle(
                                color: Color.fromARGB(134, 0, 0, 0),
                                fontFamily: "Glacial"),
                          ),
                          Icon(
                            Icons.search,
                            color: Color.fromARGB(134, 0, 0, 0),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Common Playlists",
                        style: TextStyle(
                            color: AppColor.details,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: 350, minHeight: 20),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () =>
                                {getData(predefinedListMixes[index].mix)},
                            child: Container(
                              width: MediaQuery.of(context).size.width - 36,
                              height: 50,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Color.fromARGB(24, 255, 255, 255)),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      predefinedListMixes[index].image,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      predefinedListMixes[index].mix,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Glacial',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ]),
                            ));
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 60),
                        child: Text(
                          "Featured Playlists",
                          style: TextStyle(
                              color: AppColor.details,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Carrousel(
                    playlist: predefinedFeaturedPlaylists,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 60),
                        child: Text(
                          "Featured Artists",
                          style: TextStyle(
                              color: AppColor.details,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Carrousel(
                    playlist: preDefinedArtistPlaylist,
                  ),
                ]),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Divider(
                          height: 50,
                          thickness: 5,
                          color: AppColor.details,
                        )
                      ],
                    ))
                  ],
                )
              ])
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child:
                          CircularProgressIndicator(color: AppColor.details)),
                  Text(
                    "Loading...",
                    style: TextStyle(
                        color: AppColor.details,
                        fontFamily: 'Poppins',
                        fontSize: 20),
                  )
                ],
              ));
  }
}

class Mock {
  Mock({
    required this.mix,
    required this.image,
  });
  String mix;
  String image;
}
