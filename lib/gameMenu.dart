import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:songapp/global/colors.dart';

class GameMenu extends StatefulWidget {
  const GameMenu({super.key});

  @override
  State<GameMenu> createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
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
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Players",
                style: TextStyle(
                    color: AppColor.details,
                    fontSize: 35,
                    fontFamily: "Glacial",
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: List.generate(
                4,
                (index) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width - 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                                fontFamily: 'Glacial',
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )),
          )
        ],
      ),
    );
  }
}
