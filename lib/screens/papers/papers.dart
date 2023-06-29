import 'package:agneya/screens/papers/connection/papers_api.dart';
import 'package:agneya/screens/viewer/viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PapersPage extends StatelessWidget {
  final int semNo;
  final String courseCode;
  final String courseName;
  const PapersPage(
      {super.key,
      required this.semNo,
      required this.courseCode,
      required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          courseName,
          overflow: TextOverflow.visible,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Previous Year Paper\nSemester $semNo",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: FutureBuilder(
                future: PapersApi.getQuestionPapers(semNo, courseCode),
                builder: (context, snapshot) {
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
                        final papers = snapshot.data;

                        return ListView.builder(
                            itemCount: papers?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: ExpansionTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  collapsedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  title: Text(
                                    papers![index].paperName.toString(),
                                    style: GoogleFonts.nunitoSans(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  backgroundColor: const Color(0xFF36373B),
                                  collapsedBackgroundColor:
                                      const Color(0xFF36373B),
                                  childrenPadding: const EdgeInsets.all(15),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewerPage(
                                                      courseName: papers[index].paperName!,
                                                        year: papers[index].year!,
                                                        url: papers[index]
                                                            .paperUrl!)));
                                      },
                                      child: Text(
                                        papers[index].year.toString(),
                                        style: GoogleFonts.nunitoSans(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
