import 'package:agneya/screens/root/root.dart';
import 'package:agneya/screens/welcome/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Lottie Animation
                Center(
                  child: Lottie.asset(
                    "assets/lotties/home.json",
                    width: screenSize.width * 0.75,
                    height: screenSize.height * 0.50,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
                //Welcome Text
                Text("A one stop solution for all the updates from BMC",
                    textAlign: TextAlign.center, style: WelcomeStyling.heading),
                SizedBox(
                  height: screenSize.height * 0.010,
                ),

                Text(
                  "Previous Year Question Papers and College Updates",
                  textAlign: TextAlign.center,
                  style: WelcomeStyling.subTitle,
                ),

                SizedBox(height: screenSize.height * 0.1),

                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const RootPage()),
                        (route) => false);
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(
                    "Continue",
                    style: WelcomeStyling.continueButton,
                  ),
                ),

                SizedBox(
                  height: screenSize.height * 0.070,
                ),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "By continuing you agree to our ",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: "\nTerms & Conditions",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),

                SizedBox(
                  height: screenSize.height * 0.010,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
