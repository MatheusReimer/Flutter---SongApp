import 'package:flutter/material.dart';

import 'global/colors.dart';

class GameConfig extends StatefulWidget {
  const GameConfig({super.key});

  @override
  State<GameConfig> createState() => _GameConfigState();
}

class _GameConfigState extends State<GameConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
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
            Container(
              padding: EdgeInsets.only(left: 60, top: 10),
              child: Text(
                "GUESSIT",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Glacial',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Link in Park Mix",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Glacial',
                    fontSize: 18,
                    fontWeight: FontWeight.bold))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("20 Songs (Multiple Artists)",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Glacial',
                    fontSize: 15,
                    fontWeight: FontWeight.bold))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColor.details,
                  width: 10,
                ),
              ),
              child: Image.asset('assets/placeholder.png'),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Duration",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Glacial",
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: 75,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.details,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "2 sec",
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'Glacial'),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Extreme",
                      style: TextStyle(color: AppColor.details),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 75,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "4 sec",
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'Glacial'),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Hard",
                      style: TextStyle(color: AppColor.details),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 75,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "6 sec",
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'Glacial'),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Medium",
                      style: TextStyle(color: AppColor.details),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 75,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "8 sec",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Glacial',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Easy",
                      style: TextStyle(color: AppColor.details),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Attemps",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Glacial',
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: 75,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.details,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "1",
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'Glacial'),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Extreme",
                      style: TextStyle(color: AppColor.details),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 75,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "2",
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'Glacial'),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Hard",
                      style: TextStyle(color: AppColor.details),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 75,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "3",
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'Glacial'),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Medium",
                      style: TextStyle(color: AppColor.details),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 75,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "4",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Glacial',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Easy",
                      style: TextStyle(color: AppColor.details),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Players",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Glacial',
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: Text(
                "4",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontFamily: 'Glacial',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Rounds",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Glacial',
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: Text(
                "4",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontFamily: 'Glacial',
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Glacial',
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right: 32),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: AppColor.details,
              ),
            )
          ],
        )
      ]),
    );
  }
}
