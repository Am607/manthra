import 'dart:math';

import 'package:flutter/material.dart';
import 'package:manthra/controller/firbaseAuth.dart';
import 'package:manthra/view/student/attendanceView.dart';
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
      appBar: AppBar(title: Text('Home Page'), actions: [
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
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppBigButton(
                name: 'Add Student',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentView()));
                },
              ),
              AppBigButton(
                name: 'Add Attendance',
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => StudentView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
