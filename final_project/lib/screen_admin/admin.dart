import 'package:final_project/screens/home.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroung.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.05, screenHeight * 0.05, screenWidth * 0.05, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SU",
                        style: TextStyle(
                          color: const Color(0XFF172A3A),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Color(0XFF172A3A), size: 25),
                        onPressed: () {
                         Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) =>Home()),
);

                        },
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Color(0XFF172A3A),
                    fontSize: 43,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Join our community",
                  style: TextStyle(
                    fontSize: 21,
                    color: Color.fromARGB(210, 23, 42, 58),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(179, 23, 42, 58),
                  thickness: 3,
                  indent: 40,
                  endIndent: 40,
                ),
                Image.asset(
                  "images/schedule-unscreen.gif",
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.25,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: const Color(0XFF3C84B2).withOpacity(0.9), 
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      buildTextField("Admin ID"),
                      const SizedBox(height: 20),
                      buildTextField("Password", isPassword: true),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          debugPrint("Login button pressed!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF285A7A), // تحسين اللون
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 23,
                            color: Color(0XFFCADFED),
                            fontFamily: 'CrimsonText',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF4A4A4A)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
    );
  }
}
