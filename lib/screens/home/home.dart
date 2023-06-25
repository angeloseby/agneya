import 'package:agneya/screens/home/widgets/resources_card.dart';
import 'package:agneya/screens/home/widgets/scroll.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Scroll(),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Resources",
            style: GoogleFonts.nunitoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              children: [
                ResourcesCard(
                  screenSize: screenSize,
                  title: "Kiranam",
                  subTitle: "COLLEGE MAGAZINE",
                  imgUrl:
                      'https://raw.githubusercontent.com/agneya2022/agneya/main/mag_cover.png',
                ),
                ResourcesCard(
                  screenSize: screenSize,
                  title: "Question Papers",
                  subTitle: "PREVIOUS YEAR",
                  imgUrl:
                      'https://raw.githubusercontent.com/agneya2022/agneya/main/exam.png',
                ),
                ResourcesCard(
                  screenSize: screenSize,
                  title: "Study Notes",
                  subTitle: "DETAILED STUDY NOTES",
                  imgUrl:
                      'https://raw.githubusercontent.com/agneya2022/agneya/main/notes.jpg',
                ),
                ResourcesCard(
                  screenSize: screenSize,
                  title: "College Updates",
                  subTitle: "HAPPENINGS IN BMC",
                  imgUrl:
                      'https://raw.githubusercontent.com/agneya2022/agneya/main/bmc.jpg',
                ),
                ResourcesCard(
                  screenSize: screenSize,
                  title: "Placement Desk",
                  subTitle: "UPDATES FROM PLACEMENT CELL",
                  imgUrl:
                      'https://raw.githubusercontent.com/agneya2022/agneya/main/tpo.jpeg',
                ),
                ResourcesCard(
                  screenSize: screenSize,
                  title: "University Updates",
                  subTitle: "UPDATES FROM MGU",
                  imgUrl:
                      'https://raw.githubusercontent.com/agneya2022/agneya/main/mgu.png',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
