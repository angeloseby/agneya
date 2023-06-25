import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Add Event"),
          titleTextStyle: GoogleFonts.nunitoSans(
            fontSize: 16,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          subtitleTextStyle: GoogleFonts.nunitoSans(
            fontSize: 12,
          ),
          subtitle:
              const Text("Add events or other helpful resources in this app"),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(),
        ListTile(
          title: const Text("Request Resources"),
          subtitle: const Text("Request for question papers and notes."),
          titleTextStyle: GoogleFonts.nunitoSans(
            fontSize: 16,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          subtitleTextStyle: GoogleFonts.nunitoSans(
            fontSize: 12,
          ),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(),
        ListTile(
          title: const Text("Report Bug & Suggestions"),
          subtitle: const Text("Give feedbacks and suggestion for this app."),
          titleTextStyle: GoogleFonts.nunitoSans(
            fontSize: 16,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          subtitleTextStyle: GoogleFonts.nunitoSans(
            fontSize: 12,
          ),
          trailing: const Icon(Icons.navigate_next),
        ),
        const Divider(),
        ListTile(
          title: const Text("Contact Us"),
          trailing: const Icon(Icons.navigate_next),
          titleTextStyle: GoogleFonts.nunitoSans(
            fontSize: 16,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
