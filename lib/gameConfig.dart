import 'package:flutter/material.dart';
import 'package:songapp/gameMenu.dart';

import 'global/colors.dart';

int convStrToInt(String str) {
  var list = [
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
  ];
  return list.indexOf(str);
}

UserConfig convertToInt(
    Players players, Rounds rounds, Attempts attempts, Seconds seconds) {
  return (UserConfig(
      numberOfAttempts: convStrToInt(attempts.name.toString()),
      numberOfPlayers: convStrToInt(players.name.toString()),
      numberOfRounds: convStrToInt(rounds.name.toString()),
      numberOfSeconds: convStrToInt(seconds.name.toString())));
}

class UserConfig {
  final int numberOfPlayers;
  final int numberOfRounds;
  final int numberOfAttempts;
  final int numberOfSeconds;

  const UserConfig(
      {required this.numberOfAttempts,
      required this.numberOfPlayers,
      required this.numberOfRounds,
      required this.numberOfSeconds});
}

class GameConfig extends StatefulWidget {
  final String imageUrl;
  final String playListName;
  final int numberOfSongs;
  final String owner;

  const GameConfig({
    Key? key,
    required this.imageUrl,
    required this.numberOfSongs,
    required this.playListName,
    required this.owner,
  }) : super(key: key);

  @override
  State<GameConfig> createState() => _GameConfigState();
}

enum Seconds { two, four, six, eight }

enum Attempts { one, two, three, four }

enum Players { two, three, four, five, six, seven, eight }

enum Rounds { one, two, four, eight }

class _GameConfigState extends State<GameConfig> {
  Players? _players = Players.four;
  Seconds? _seconds = Seconds.two;
  Attempts? _attempts = Attempts.one;
  Rounds? _rounds = Rounds.one;
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
          children: [
            Text(widget.playListName,
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
            Text('${widget.numberOfSongs}Songs (${widget.owner})',
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
                          backgroundImage: widget.imageUrl != ""
                              ? NetworkImage(widget.imageUrl)
                              : AssetImage('assets/logo.png') as ImageProvider,
                          radius: 95,
                        ))))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Duration",
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: 'Poppins'))
          ],
        ),
        Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('2 Seconds',
                      style: TextStyle(color: Colors.white)),
                  leading: Radio<Seconds>(
                    activeColor: AppColor.details,
                    value: Seconds.two,
                    groupValue: _seconds,
                    onChanged: (Seconds? value) {
                      setState(() {
                        _seconds = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    '4 Seconds',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio<Seconds>(
                    activeColor: AppColor.details,
                    value: Seconds.four,
                    groupValue: _seconds,
                    onChanged: (Seconds? value) {
                      setState(() {
                        _seconds = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    '6 Seconds',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio<Seconds>(
                    value: Seconds.six,
                    activeColor: AppColor.details,
                    groupValue: _seconds,
                    onChanged: (Seconds? value) {
                      setState(() {
                        _seconds = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    '8 Seconds',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio<Seconds>(
                    value: Seconds.eight,
                    activeColor: AppColor.details,
                    groupValue: _seconds,
                    onChanged: (Seconds? value) {
                      setState(() {
                        _seconds = value;
                      });
                    },
                  ),
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Attempts",
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: 'Poppins'))
          ],
        ),
        Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title:
                      const Text('One', style: TextStyle(color: Colors.white)),
                  leading: Radio<Attempts>(
                    activeColor: AppColor.details,
                    value: Attempts.one,
                    groupValue: _attempts,
                    onChanged: (Attempts? value) {
                      setState(() {
                        _attempts = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title:
                      const Text('Two', style: TextStyle(color: Colors.white)),
                  leading: Radio<Attempts>(
                    activeColor: AppColor.details,
                    value: Attempts.two,
                    groupValue: _attempts,
                    onChanged: (Attempts? value) {
                      setState(() {
                        _attempts = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Three',
                      style: TextStyle(color: Colors.white)),
                  leading: Radio<Attempts>(
                    activeColor: AppColor.details,
                    value: Attempts.three,
                    groupValue: _attempts,
                    onChanged: (Attempts? value) {
                      setState(() {
                        _attempts = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title:
                      const Text('Four', style: TextStyle(color: Colors.white)),
                  leading: Radio<Attempts>(
                    activeColor: AppColor.details,
                    value: Attempts.four,
                    groupValue: _attempts,
                    onChanged: (Attempts? value) {
                      setState(() {
                        _attempts = value;
                      });
                    },
                  ),
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Players",
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: 'Poppins'))
          ],
        ),
        Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title:
                      const Text('Two', style: TextStyle(color: Colors.white)),
                  leading: Radio<Players>(
                    activeColor: AppColor.details,
                    value: Players.two,
                    groupValue: _players,
                    onChanged: (Players? value) {
                      setState(() {
                        _players = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Three',
                      style: TextStyle(color: Colors.white)),
                  leading: Radio<Players>(
                    activeColor: AppColor.details,
                    value: Players.three,
                    groupValue: _players,
                    onChanged: (Players? value) {
                      setState(() {
                        _players = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title:
                      const Text('Four', style: TextStyle(color: Colors.white)),
                  leading: Radio<Players>(
                    activeColor: AppColor.details,
                    value: Players.four,
                    groupValue: _players,
                    onChanged: (Players? value) {
                      setState(() {
                        _players = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title:
                      const Text('Five', style: TextStyle(color: Colors.white)),
                  leading: Radio<Players>(
                    activeColor: AppColor.details,
                    value: Players.five,
                    groupValue: _players,
                    onChanged: (Players? value) {
                      setState(() {
                        _players = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title:
                      const Text('Six', style: TextStyle(color: Colors.white)),
                  leading: Radio<Players>(
                    activeColor: AppColor.details,
                    value: Players.six,
                    groupValue: _players,
                    onChanged: (Players? value) {
                      setState(() {
                        _players = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Seven',
                      style: TextStyle(color: Colors.white)),
                  leading: Radio<Players>(
                    activeColor: AppColor.details,
                    value: Players.seven,
                    groupValue: _players,
                    onChanged: (Players? value) {
                      setState(() {
                        _players = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Eight',
                      style: TextStyle(color: Colors.white)),
                  leading: Radio<Players>(
                    activeColor: AppColor.details,
                    value: Players.eight,
                    groupValue: _players,
                    onChanged: (Players? value) {
                      setState(() {
                        _players = value;
                      });
                    },
                  ),
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Rounds",
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: 'Poppins'))
          ],
        ),
        Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  title:
                      const Text('One', style: TextStyle(color: Colors.white)),
                  leading: Radio<Rounds>(
                    activeColor: AppColor.details,
                    value: Rounds.one,
                    groupValue: _rounds,
                    onChanged: (Rounds? value) {
                      setState(() {
                        _rounds = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title:
                      const Text('Two', style: TextStyle(color: Colors.white)),
                  leading: Radio<Rounds>(
                    activeColor: AppColor.details,
                    value: Rounds.two,
                    groupValue: _rounds,
                    onChanged: (Rounds? value) {
                      setState(() {
                        _rounds = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title:
                      const Text('Four', style: TextStyle(color: Colors.white)),
                  leading: Radio<Rounds>(
                    activeColor: AppColor.details,
                    value: Rounds.four,
                    groupValue: _rounds,
                    onChanged: (Rounds? value) {
                      setState(() {
                        _rounds = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Eight',
                      style: TextStyle(color: Colors.white)),
                  leading: Radio<Rounds>(
                    activeColor: AppColor.details,
                    value: Rounds.eight,
                    groupValue: _rounds,
                    onChanged: (Rounds? value) {
                      setState(() {
                        _rounds = value;
                      });
                    },
                  ),
                ),
              ],
            )),
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
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                        return GameMenu(
                          config: convertToInt(
                              _players!, _rounds!, _attempts!, _seconds!),
                          image: widget.imageUrl,
                          numberOfSongs: widget.numberOfSongs,
                          playlist: widget.playListName,
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
      ]),
    );
  }
}
