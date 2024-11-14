import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/services/services.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/view/add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskServices? services;

  Future<List<String>> getAllTasks() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    services = TaskServices(prefs: sharedPreferences);
    return services?.getTasks() ?? [];
  }

  @override
  void initState() {
    getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff5f33e1),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddTask()));
          print('done');
        },
        tooltip: 'Add task',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      // body ui

      body: FutureBuilder<List<String>>(
          future: getAllTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.w),
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 90.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff5f33e1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data!.isNotEmpty
                                  ? "Your today's task\nalmost done!"
                                  : "There are no\ntasks today.",
                              style: GoogleFonts.lexendDeca(
                                  color: Colors.white,
                                  fontSize: 2.h,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image.asset(
                              "assets/homePage.png",
                              height: 12.h,
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 0.5.h),
                          child: Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 2.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 55.w,
                                    child: Text(
                                      snapshot.data?[index] ?? "",
                                      softWrap: true,
                                      style: GoogleFonts.lexendDeca(
                                          fontSize: 2.h,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        services!.deleteTask(index);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffede4ff),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Icon(
                                        Icons.delete_rounded,
                                        color: Color(0xff9260f4),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
