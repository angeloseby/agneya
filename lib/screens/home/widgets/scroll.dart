import 'package:agneya/screens/home/connection/scroll_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Scroll extends StatefulWidget {
  const Scroll({
    super.key,
  });

  @override
  State<Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  List grads = [
    [const Color(0xFF2E3192), const Color(0xFF1BFFFF)],
    [const Color(0xFFD4145A), const Color(0xFFFBB03B)],
    [const Color(0xFF009245), const Color(0xFFFCEE21)],
    [const Color(0xFF662D8C), const Color(0xFFED1E79)],
    [const Color(0xFFFF5F6D), const Color(0xFFFFC371)],
  ];
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: ScrollApi.getScrolls(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );

            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Some Error has Occured"),
                );
              } else {
                final List scrolls = snapshot.data as List;
                return CarouselSlider.builder(
                  itemCount: scrolls.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Card(
                      elevation: 2.0,
                      child: Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: grads[index % 5],
                            begin: index % 2 == 0
                                ? Alignment.topLeft
                                : Alignment.bottomRight,
                            end: index % 2 == 0
                                ? Alignment.topRight
                                : Alignment.bottomLeft,
                          ),
                        ),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: scrolls[index].title,
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: "\n${scrolls[index].subTitle}",
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 0.85,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.1,
                    autoPlay: true,
                    aspectRatio: 20 / 9,
                  ),
                );
              }
          }
        });
  }
}
