import 'package:agneya/screens/papers/papers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'connections/semesters_api.dart';

class SemesterPage extends StatefulWidget {
  const SemesterPage(
      {super.key,
      required this.imgUrl,
      required this.courseCode,
      required this.courseName});
  final String courseCode;
  final String imgUrl;
  final String courseName;

  @override
  State<SemesterPage> createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CoursesAppBarDelegate(
                courseName: widget.courseName,
                imgUrl: widget.imgUrl,
                courseCode: widget.courseCode,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                    child: Text(
                      "Semesters",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  FutureBuilder(
                    future: SemestersApi.getSemesters(widget.courseCode),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Some error has occurred"),
                            );
                          } else {
                            final int sems = snapshot.data;

                            return Container(
                              margin: const EdgeInsets.all(15),
                              height: MediaQuery.of(context).size.height * 0.50,
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 3.8 / 4,
                                  ),
                                  itemCount: sems,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => PapersPage(
                                              courseName: widget.courseName,
                                              semNo: index + 1,
                                              courseCode: widget.courseCode,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF36373B),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Semester ${index + 1} Papers",
                                                  maxLines: 3,
                                                  style: GoogleFonts.nunitoSans(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Image.network(
                                                  'https://raw.githubusercontent.com/agneya2022/agneya/main/qp.png',
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// This custom delegate is responsible for the stretchy animated AppBar.

class CoursesAppBarDelegate extends SliverPersistentHeaderDelegate {
  final String courseName;
  final String imgUrl;
  final String courseCode;

  CoursesAppBarDelegate(
      {required this.courseName,
      required this.imgUrl,
      required this.courseCode});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: progress,
            child: ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: 1 - progress,
            child: Hero(
              tag: courseCode,
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              gradient: LinearGradient.lerp(
                  const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.transparent,
                    ],
                  ),
                  const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
                  progress),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: EdgeInsets.lerp(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              const EdgeInsets.only(bottom: 16),
              progress,
            ),
            alignment: Alignment.lerp(
              Alignment.bottomLeft,
              Alignment.bottomCenter,
              progress,
            ),
            child: Text(
              courseName,
              style: TextStyle.lerp(
                GoogleFonts.nunitoSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                GoogleFonts.nunitoSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                progress,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: AnimatedContainer(
                margin: const EdgeInsets.only(
                  left: 6,
                ),
                padding: const EdgeInsets.only(left: 8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.lerp(
                      Colors.grey.shade100, Colors.transparent, progress),
                ),
                duration: const Duration(milliseconds: 100),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color.lerp(Colors.black, Colors.white, progress),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 264;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();
}
