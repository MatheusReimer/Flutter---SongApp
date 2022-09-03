import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'global/colors.dart';

class SongDetail extends StatefulWidget {
  const SongDetail({super.key});

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
          children: [
            Expanded(
              child: Image.asset(
                "assets/placeholder.png",
                height: 400,
                fit: BoxFit.fitHeight,
                color: Colors.white.withOpacity(0.2),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: AppColor.details,
          height: 5,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PLAYER 1",
              style: TextStyle(
                  color: AppColor.details,
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
          height: 30,
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
        SizedBox(
          height: 30,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Image.asset(
                'assets/wave.png',
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
