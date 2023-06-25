import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PapersPage extends StatefulWidget {
  const PapersPage({super.key});

  @override
  State<PapersPage> createState() => _PapersPageState();
}

class _PapersPageState extends State<PapersPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabcontroller = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BA English",
          style: GoogleFonts.nunitoSans(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Previous Year Papers",
                style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              child: TabBar(controller: tabcontroller, tabs: [
                Tab(
                  text: "Places",
                ),
                Tab(
                  text: "Semester 3",
                )
              ]),
            ),
            Container(
              width: double.maxFinite,
              height: 500,
              child: TabBarView(controller: tabcontroller, children: [
                Text("Hi"),
                Text("Hello"),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
