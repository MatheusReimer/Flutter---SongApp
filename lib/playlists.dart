import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:songapp/components/carrousel.dart';
import 'package:songapp/global/colors.dart';

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  List playlist = ['Metal Mix', 'Pop Mix', 'Funk Mix', 'Rock Mix', 'Jazz Mix'];
  List quantityMusics = [10, 12, 14, 16, 18];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: ListView(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
            children: [
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
                      onTap: () => {},
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
                Column(
                  children: List.generate(
                      5,
                      (index) => Container(
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
                                    'assets/vinil.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    playlist[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Glacial',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                          )),
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
                  playlist: playlist,
                  quantityMusic: quantityMusics,
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
                  playlist: playlist,
                  quantityMusic: quantityMusics,
                ),
              ]),
            ]));
  }
}
