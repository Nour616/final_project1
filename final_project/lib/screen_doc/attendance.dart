import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  _AttendanceState createState() => _AttendanceState();

  static Map<String, List<String>> attendanceData = {};
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              "SU",
              style: TextStyle(
                color: Color(0XFF172A3A),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Text(
              "سجل الحضور",
              style: TextStyle(
                color: Color(0XFF172A3A),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
          ],
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset("images/back.png", height: 30, width: 30),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/backgroung.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            top: 120,
            child: ListView.builder(
              itemCount: Attendance.attendanceData.length,
              itemBuilder: (context, index) {
                String subject = Attendance.attendanceData.keys.elementAt(index);
                List<String> attendanceList = Attendance.attendanceData[subject] ?? [];
                return ExpansionTile(
                  title: Text(subject, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  children: attendanceList.map((entry) => ListTile(title: Text(entry, style: TextStyle(color: Colors.white)))).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
