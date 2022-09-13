import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:songapp/global/colors.dart';
import 'package:songapp/playlists.dart';
import 'package:songapp/services/api.dart';
import 'package:uni_links/uni_links.dart';

import 'models/AcessToken.dart';
import 'models/Auth.dart';

TokenModel code = TokenModel();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

handleServices() async {
  SpotifyApiServices().launchURLAuth();
}

class _HomePageState extends State<HomePage> {
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
          if (!mounted) {
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (BuildContext context) {
              return Playlists();
            }),
          );
        }
      }
      // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  @override
  void dispose() {
    _sub!.cancel();
    super.dispose();
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
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 25, left: 10),
                  child: Image.asset('assets/miniLogo.png',
                      width: 100, height: 100, fit: BoxFit.fill),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 2,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, left: 50, bottom: 10),
                  child: Text(
                    "Time to sharpen",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: 'Glacial',
                      letterSpacing: 7,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, right: 50, bottom: 10),
                  child: Text(
                    "YOUR EARS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Glacial',
                        letterSpacing: 5,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: GestureDetector(
                          child: Text("Tap to Start",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 33,
                                  fontFamily: "Glacial",
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          /*
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                              return Playlists();
                            }),
                          );
                          */
                          handleServices();
                        },
                        icon: const Icon(Icons.play_circle),
                        color: AppColor.details,
                        iconSize: 40,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
