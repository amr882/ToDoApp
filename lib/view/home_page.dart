import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/services/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/widgets/progress_indecator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  TaskServices? services;

  Future<List<String>> sheredP() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    services = TaskServices(prefs: sharedPreferences);
    return services?.getTasks() ?? [];
  }

  double getTotalTaskProgress(int completedTasks, int totalTasks) {
    if (totalTasks == 0) {
      return 0.0;
    }
    return (completedTasks / totalTasks) * 100;
  }

  @override
  void initState() {
    sheredP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Color.fromARGB(157, 191, 173, 239), blurRadius: 20)
        ]),
        child: CurvedNavigationBar(
          color: const Color(0xffEEE9FF),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: const Color(0xff5f33e1),
          items: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 4.h,
              ),
            ),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),

      // body ui

      body: FutureBuilder(
        future: sheredP(),
        builder: (context, snapshot) {
          print(snapshot.data!.length);
          return Column(
            children: [
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    width: 90.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff5f33e1),
                    ),
                    child: ProgressIndecator(
                      hasData: snapshot.hasData,
                      value: getTotalTaskProgress(
                        21,
                        snapshot.data?.length ?? 0,
                      ),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
