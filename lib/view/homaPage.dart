import 'package:flutter/material.dart';
import 'package:manthra/controller/firbaseAuth.dart';
import 'package:manthra/view/login.dart';
import 'package:manthra/view/widgets.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            AuthService().signOut().then((value) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            });
          },
          icon: Icon(Icons.logout),
        )
      ]),
      body: Center(
        child: AppBigButton(
          name: 'Add Attendance',
          onPressed: () {},
        ),
      ),
    );
  }
}
