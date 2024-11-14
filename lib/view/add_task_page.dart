import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/services/services.dart';
import 'package:to_do_app/view/home_page.dart';
import 'package:to_do_app/widgets/button.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add task",
          style: GoogleFonts.lexendDeca(
              fontSize: 2.h, fontWeight: FontWeight.w500),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/background.png",
            height: 100.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SizedBox(
                    child: TextField(
                      minLines: 1,
                      controller: controller,
                      maxLines: 50,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Add task",
                        hintStyle: GoogleFonts.lexendDeca(
                            fontSize: 2.h, fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                    ),
                  ),
                ),
                Button(
                  onTap: () async {
                    if (controller.text.isNotEmpty) {
                      final sharedPreferences =
                          await SharedPreferences.getInstance();
                      TaskServices(prefs: sharedPreferences)
                          .addTask(controller.text);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    }
                  },
                  title: "Add Task",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
