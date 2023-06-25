import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourcesCard extends StatelessWidget {
  const ResourcesCard(
      {super.key,
      required this.screenSize,
      required this.title,
      required this.subTitle,
      required this.imgUrl});
  final String title, subTitle;
  final Size screenSize;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width / 2,
      height: screenSize.width / 2,
      decoration: BoxDecoration(
        color: const Color(0xFF36373B),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imgUrl,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\n$subTitle",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
