import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:songapp/global/colors.dart';

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
                    child: Image.network(widget.image),
                  ),
                ]))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Matheus(1)",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Glacial",
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Color.fromARGB(255, 53, 53, 53)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.play_circle_filled_sharp,
                            color: Colors.white,
                            size: 100,
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 50,
                        child: ProgressBar(
                          progressBarColor: AppColor.details,
                          baseBarColor: AppColor.details.withOpacity(0.5),
                          thumbColor: AppColor.details,
                          progress: Duration(seconds: 0),
                          buffered: Duration(seconds: 2),
                          total: Duration(seconds: 5),
                          timeLabelTextStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                          onSeek: (duration) {
                            print('User selected a new time: $duration');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Song: Castle of Glass",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 17,
                                  fontFamily: 'Glacial',
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ])))
      ]),
    );
  }
}
