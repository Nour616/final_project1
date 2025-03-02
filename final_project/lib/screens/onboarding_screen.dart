import 'package:final_project/screens/home.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroung.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// **شعار SU**
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.02),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "SU",
                    style: TextStyle(
                      color: const Color(0XFF172A3A),
                      fontSize: screenWidth * 0.12, // متغير حسب الشاشة
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              /// **عنوان الترحيب**
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Welcome!",
                style: TextStyle(
                  color: const Color(0XFF172A3A),
                  fontSize: screenWidth * 0.1, // متغير حسب الشاشة
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                ),
              ),

              /// **نص قصير تحفيزي**
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Join our community",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: const Color.fromARGB(210, 23, 42, 58),
                ),
              ),

              /// **فاصل ديكوري**
              SizedBox(height: screenHeight * 0.01),
              Divider(
                color: const Color.fromARGB(179, 23, 42, 58),
                thickness: 3,
                indent: screenWidth * 0.1,
                endIndent: screenWidth * 0.1,
              ),

              /// **الوصف الرئيسي**
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                child: Text(
                  "The Sinai University Attendance App is a user-friendly tool designed to simplify attendance management for both students and faculty. With this app, students can conveniently mark their attendance for classes, while instructors can easily track and manage attendance records in real-time. The app ensures accuracy, transparency, and efficiency in the attendance process, supporting the university’s commitment to modernizing academic operations.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'CrimsonText',
                    fontSize: screenWidth * 0.045,
                    color: const Color(0XFF172A3A),
                  ),
                ),
              ),

              /// **زر البدء**
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF172A3A),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.25,
                    vertical: screenHeight * 0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Let’s start",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.white,
                    fontFamily: 'CrimsonText',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
