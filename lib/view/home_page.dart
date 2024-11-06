import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/services/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';

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
          color: const Color(0xffeee9ff),
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
    );
  }
}
