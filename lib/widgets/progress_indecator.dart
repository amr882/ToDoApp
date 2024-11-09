import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class ProgressIndecator extends StatelessWidget {
  final bool hasData;
  final double value;
  const ProgressIndecator(
      {super.key, required this.hasData, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          hasData
              ? "Your today's task\nalmost done!"
              : "There are no tasks today.",
          style: GoogleFonts.lexendDeca(
              color: Colors.white, fontSize: 2.h, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CircularPercentIndicator(
            radius: 5.h,
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            animationDuration: 200,
            percent: value/100,
            backgroundColor: const Color(0xff8764ff),
            center: Text("${value.toInt()}%",
                style: GoogleFonts.lexendDeca(
                    color: Colors.white,
                    fontSize: 2.h,
                    fontWeight: FontWeight.w500)),
            progressColor: Colors.white,
          ),
        ),
      ],
    );
  }
}


//  SizedBox(
//           height: 7.h,
//           width: 7.h,
//           child: CircularProgressIndicator(
//             value: 70 / 100,
//             valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
//             strokeCap: StrokeCap.round,
//             strokeWidth: 0.7.h,
//           ),
//         )