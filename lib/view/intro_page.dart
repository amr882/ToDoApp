import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/view/add_task_page.dart';
import 'package:to_do_app/view/home_page.dart';
import 'package:to_do_app/widgets/button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
          ),
          Image.asset(
            "assets/background.png",
            height: 100.h,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Image.asset(
                  "assets/intro.png",
                  height: 30.h,
                ),
                Column(
                  children: [
                    Text("Task Management &\nTo-Do List",
                        style: GoogleFonts.lexendDeca(
                            fontSize: 2.6.h, color: const Color(0xff24252C)),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: Text(
                          "This productive tool is designed to help\nyou better manage your task\n project-wise conveniently!",
                          style: GoogleFonts.lexendDeca(
                              fontSize: 1.5.h, color: const Color(0xff24252C)),
                          textAlign: TextAlign.center),
                    ),
                    Button(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddTaskPage()));
                            print("done");
                      },
                      title: "Let’s Start",
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
