import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:songapp/gameConfig.dart';
import 'package:songapp/global/colors.dart';
import 'package:songapp/song.dart';

class GameMenu extends StatefulWidget {
  final UserConfig config;
  final String image;
  final String playlist;
  final int numberOfSongs;

  const GameMenu(
      {Key? key,
      required this.config,
      required this.image,
      required this.playlist,
      required this.numberOfSongs})
      : super(key: key);

  @override
  State<GameMenu> createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> {
  var maxLength = 15;
  var textLength = 0;

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
            children: [
              Text(widget.playlist,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Glacial',
                      fontSize: 18,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Songs: (${widget.numberOfSongs})",
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
                  margin: EdgeInsets.only(top: 30, bottom: 15),
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                      radius: 160,
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: CircleAvatar(
                            backgroundImage: widget.image != ""
                                ? NetworkImage(widget.image)
                                : AssetImage('assets/logo.png')
                                    as ImageProvider,
                            radius: 95,
                          ))))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Players',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: "Glacial",
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: List.generate(
                widget.config.numberOfPlayers,
                (index) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width - 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: TextFormField(
                              initialValue: 'Player $index',
                              maxLength: maxLength,
                              onChanged: (value) {
                                setState(() {
                                  textLength = value.length;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                suffixText:
                                    '${textLength.toString()}/${maxLength.toString()}',
                                counterText: "",
                                labelText: 'Player name',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.details,
                                ),
                              ),
                            ))
                      ],
                    )),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.all(18),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return SongDetail(
                            image: widget.image,
                          );
                        }),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ))
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
        ],
      ),
    );
  }
}
