import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'attendance.dart'; 

class SubjectQRScreen extends StatefulWidget {
  const SubjectQRScreen({super.key});

  @override
  _SubjectQRScreenState createState() => _SubjectQRScreenState();
}

class _SubjectQRScreenState extends State<SubjectQRScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  String? _qrData;
  Timer? _timer;
  int _secondsRemaining = 60;

  void _generateQR() {
    String subject = _subjectController.text.trim();
    String startTime = _startTimeController.text.trim();
    String endTime = _endTimeController.text.trim();

    if (subject.isNotEmpty && startTime.isNotEmpty && endTime.isNotEmpty) {
      setState(() {
        _qrData = "$subject|$startTime|$endTime";
        _secondsRemaining = 60;
        
        
        if (!Attendance.attendanceData.containsKey(subject)) {
          Attendance.attendanceData[subject] = [];
        }
      });

      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_secondsRemaining > 0) {
          setState(() {
            _secondsRemaining--;
          });
        } else {
          timer.cancel();
          setState(() {
            _qrData = null;
          });
          Fluttertoast.showToast(msg: "انتهت صلاحية الكود!");
        }
      });
    } else {
      Fluttertoast.showToast(msg: "يرجى إدخال جميع البيانات!");
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _subjectController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBackground(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(context),
            const SizedBox(height: 40),
            const Text("Create QR Code", style: _titleStyle),
            const SizedBox(height: 20),
            const Divider(color: Color(0XFF172A3A), thickness: 3, indent: 40, endIndent: 40),
            const SizedBox(height: 20),
            _buildTextField(_subjectController, "اسم المادة"),
            const SizedBox(height: 15),
            _buildTextField(_startTimeController, "وقت بدء المحاضرة"),
            const SizedBox(height: 15),
            _buildTextField(_endTimeController, "وقت انتهاء المحاضرة"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateQR,
              style: _buttonStyle,
              child: const Text("Create QR", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            if (_qrData != null) ...[
              QrImageView(data: _qrData!, size: 200),
              const SizedBox(height: 10),
              Text("صلاحية QR: $_secondsRemaining ثانية", style: const TextStyle(fontSize: 16, color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}

/// **ملفات المساعدة للتصميم**
const TextStyle _titleStyle = TextStyle(color: Color(0XFF172A3A), fontSize: 30, fontWeight: FontWeight.bold);
final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(backgroundColor: const Color(0XFF3C84B2), padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20));

Widget _buildTextField(TextEditingController controller, String label) {
  return TextField(controller: controller, decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()));
}

Widget _buildHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text("SU", style: TextStyle(color: Color(0XFF172A3A), fontSize: 50, fontWeight: FontWeight.bold)),
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Image.asset('images/back.png', width: 50, height: 50),
      ),
    ],
  );
}

Widget _buildBackground(Widget child) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/backgroung.jpg"), fit: BoxFit.cover)),
    child: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20), child: child)),
  );
}
