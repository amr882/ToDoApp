import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const Button({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 7.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 5.h,
                  color: const Color.fromARGB(207, 163, 163, 163))
            ],
            color: const Color(0xff5f33e1),
            borderRadius: BorderRadius.circular(14)),
        child: Center(
            child: Text(
          title,
          style: GoogleFonts.lexendDeca(
              color: Colors.white, fontSize: 2.h, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
