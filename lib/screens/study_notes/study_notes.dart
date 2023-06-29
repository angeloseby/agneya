import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudyNotesPage extends StatelessWidget {
  const StudyNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study Notes",style: GoogleFonts.nunitoSans(),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://raw.githubusercontent.com/agneya2022/agneya/main/empty_box.png',width: 200,),
          const SizedBox(height: 50,),
          Text(
            'This feature is currently under production',
            style: GoogleFonts.nunitoSans(
              fontSize: 22,

            ),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            'assets/images/union.png',
            fit: BoxFit.fitWidth,
            width: 150,
          ),
        ],
      ),
    );
  }
}
