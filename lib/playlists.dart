import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:songapp/components/carrousel.dart';
import 'package:songapp/gameConfig.dart';
import 'package:songapp/global/colors.dart';
import 'package:songapp/models/Auth.dart';
import 'package:songapp/services/api.dart';
import 'models/AcessToken.dart';
import 'models/Playlists.dart';
import 'package:uni_links/uni_links.dart';

TokenModel code = TokenModel();

handleServices() async {
  SpotifyApiServices().launchURLAuth();
}

handleServicesAfterRedirect(TokenModel code) async {
  SpotifyApiServices().changeCodeForToken(code);
}

class Playlists extends StatefulWidget {
  const Playlists({
    Key? key,
  }) : super(key: key);

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  StreamSubscription? _sub;
  Future<void> initUniLinks() async {
    // ... check initialLink

    // Attach a listener to the stream
    _sub = linkStream.listen((String? link) async {
      if (link != null) {
        print('listener');
        var uri = Uri.parse(link);
        if (uri.queryParameters['code'] != null) {
          print(uri.queryParameters['code'].toString());
          code.code = uri.queryParameters['code'];
          AccessToken tokenObj =
              await SpotifyApiServices().changeCodeForToken(code);
          SpotifyApiServices().playerDevices(tokenObj.accessToken);
        }
      }
      // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

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
  List<ArtistsMyModel>? playlists = [];
  var apiListMixes = [];
  List apiListFeatured = [];
  var apiListArtists = [];
  late String authToken;

  getData(String artistName) async {
    setState(() {
      isLoaded = false;
    });
    String token = await SpotifyApiServices().getUserToken();
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
  initState() {
    super.initState();

    initUniLinks();
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
                      child: GestureDetector(
                        onTap: () async {
                          if (code.code == null) {
                            handleServices();
                          } else {
                            SpotifyApiServices().changeCodeForToken(code);
                          }
                        },
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
                      )),
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
