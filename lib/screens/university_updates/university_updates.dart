import 'package:agneya/screens/university_updates/university_update_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'university_updates_api.dart';

class UniversityUpdatesPage extends StatelessWidget {
  const UniversityUpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List grads = [
      [const Color(0xFF2E3192), const Color(0xFF1BFFFF)],
      [const Color(0xFFD4145A), const Color(0xFFFBB03B)],
      [const Color(0xFF009245), const Color(0xFFFCEE21)],
      [const Color(0xFF662D8C), const Color(0xFFED1E79)],
      [const Color(0xFFFF5F6D), const Color(0xFFFFC371)],
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/union.png',
          fit: BoxFit.fitWidth,
          width: 150,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: UniversityUpdateApi.getCollegeUpdates(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Some error has occurred"),
              );
            } else {
              final List<UniversityUpdate> collegeUpdates = snapshot.data ?? [];
              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: collegeUpdates.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  collegeUpdates[index].heading,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                content: Text(
                                  collegeUpdates[index].description,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    color: Colors.black,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse(collegeUpdates[
                                              index]
                                          .url)); //launch is from url_launcher package to launch URL
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text("OPEN LINK"),
                                  )
                                ],
                              );
                            });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.maxFinite,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
                        child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    collegeUpdates[index].heading,
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Click to know more",
                                    maxLines: 1,
                                    style: GoogleFonts.nunitoSans(),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
