import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'global/colors.dart';

class SongDetail extends StatefulWidget {
  final String image;
  const SongDetail({Key? key, required this.image}) : super(key: key);

  @override
  State<SongDetail> createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30, bottom: 15),
                height: 425,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/wave.png',
                        height: 1000, width: MediaQuery.of(context).size.width),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                          radius: 140,
                          backgroundColor: Color.fromARGB(255, 255, 196, 0),
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: CircleAvatar(
                                backgroundImage: widget.image != ""
                                    ? NetworkImage(widget.image)
                                    : AssetImage('assets/logo.png')
                                        as ImageProvider,
                                radius: 130,
                              )))),
                ]))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "PLAYER 1",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 196, 0),
                  fontFamily: "Glacial",
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Attempt 1",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Glacial",
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.play_circle,
              color: Colors.white,
              size: 120,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 150,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.details,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Song: Castle of Glass",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Glacial',
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Divider(
                  height: 10,
                  thickness: 5,
                  color: AppColor.details,
                )
              ],
            ))
          ],
        )
      ]),
    );
  }
}
