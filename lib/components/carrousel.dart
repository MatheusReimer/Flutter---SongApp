import 'dart:ffi';

import 'package:flutter/material.dart';

class Carrousel extends StatefulWidget {
  final List playlist;
  final List quantityMusic;
  const Carrousel(
      {Key? key, required this.playlist, required this.quantityMusic})
      : super(key: key);

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
          height: 250,
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
                  margin: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset('assets/vinil.png',
                        width: 150, height: 150, fit: BoxFit.fill),
                  ),
                ),
              );
            }),
            itemCount: widget.playlist.length,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            1,
            (index) => Text(
              "a",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Glacial',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
