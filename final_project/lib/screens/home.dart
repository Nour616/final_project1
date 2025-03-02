import 'package:final_project/screen_admin/Admin.dart';
import 'package:final_project/screen_student/studentlogin.dart';
import 'package:final_project/screen_doc/teacherlogin.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 27, 0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "SU",
                        style: TextStyle(
                          color: Color(0XFF172A3A),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 3),
                    child: const Text(
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
                  
                 
                  SizedBox(height: 20), 

                  _buildButton(
                    context,
                    "Teacher",
                    "images/teacher-unscreen.gif",
                    const TeacherLogin(),
                  ),

                  _buildButton(
                    context,
                    "Student",
                    "images/student-unscreen.gif",
                    const StudentLogin(),
                  ),

                  _buildButton(
                    context,
                    "Admin",
                    "images/schedule-unscreen.gif",
                    const Admin(),
                  ),

                  SizedBox(height: 30), 
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF3C84B2),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 90,
              width: 90,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                color: Color(0XFFCADFED),
                fontFamily: 'CrimsonText',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
