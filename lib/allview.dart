import 'package:agneya/screens/courses/courses.dart';
import 'package:agneya/screens/papers/papers.dart';
import 'package:agneya/screens/root/root.dart';
import 'package:agneya/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

class AllView extends StatelessWidget {
  const AllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RootPage(),
                    ),
                  );
                },
                child: const Text('Root Page')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ),
                  );
                },
                child: const Text('Welcome Page')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CoursesPage(
                        url: "",
                      ),
                    ),
                  );
                },
                child: const Text('Courses Page')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PapersPage(),
                    ),
                  );
                },
                child: const Text('Papers Page')),
          ],
        ),
      ),
    );
  }
}
