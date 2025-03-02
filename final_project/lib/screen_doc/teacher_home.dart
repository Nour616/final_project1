import 'package:final_project/screen_doc/attendance.dart';
import 'package:final_project/screen_doc/schedule.dart';
import 'package:final_project/screen_doc/subjects.dart';
import 'package:final_project/screen_doc/teacherlogin.dart';
import 'package:flutter/material.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/backgroung.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SU",
                        style: TextStyle(
                          color: Color(0XFF172A3A),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TeacherLogin()),
                          );
                        },
                        child: Image.asset('images/back.png', width: 50, height: 50),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      "Welcome !",
                      style: TextStyle(
                        color: Color(0XFF172A3A),
                        fontSize: 43,
                        fontFamily: 'PlayfairDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 3),
                    child: Text(
                      "Join our community",
                      style: TextStyle(
                        fontSize: 21,
                        color: Color.fromARGB(210, 23, 42, 58),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(179, 23, 42, 58),
                    thickness: 3,
                    indent: 40,
                    endIndent: 40,
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: Column(
                      children: [
                        _buildButton(
                          context,
                          "Schedule",
                          "images/schedule-unscreen.gif",
                          TeacherScheduleScreen(),
                        ),
                        _buildButton(
                          context,
                          "Subjects",
                          "images/books-1--unscreen.gif",
                          const SubjectQRScreen(),
                        ),
                        _buildButton(
                          context,
                          "Attendance",
                          "images/informed-unscreen.gif",
                          Attendance(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, String imagePath, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 250,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFF3C84B2),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  color: Color(0XFFCADFED),
                  fontFamily: 'CrimsonText',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
