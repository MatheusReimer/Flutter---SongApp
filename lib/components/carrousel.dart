import 'package:flutter/material.dart';

class Carrousel extends StatefulWidget {
  final List playlist;
  const Carrousel({Key? key, required this.playlist}) : super(key: key);

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  late final PageController pageController;
  int pageNo = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.80);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            itemBuilder: ((context, index) {
              return AnimatedBuilder(
                  animation: pageController,
                  builder: (ctx, child) {
                    return child!;
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 32),
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                          radius: 155,
                          backgroundColor: Colors.white,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: CircleAvatar(
                                radius: 150,
                                backgroundImage: widget.playlist.isNotEmpty
                                    ? AssetImage(widget.playlist[index].image)
                                    : AssetImage('assets/vinil.png')
                                        as ImageProvider,
                                onBackgroundImageError:
                                    (exception, stackTrace) {
                                  Image.asset('assets/vinil.png');
                                },
                              )))));
            }),
            itemCount: widget.playlist.length,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        widget.playlist.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  1,
                  (index) => SizedBox(
                    height: 50,
                    child: Text(
                      widget.playlist[pageNo].mix,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Glacial',
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            : Row()
      ],
    );
  }
}
