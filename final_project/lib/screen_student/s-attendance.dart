import 'dart:io';
import 'package:final_project/screen_doc/attendance.dart';
import 'package:final_project/screen_student/student_home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final MobileScannerController scannerController = MobileScannerController();
  String? scannedData;

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  Future<void> _saveAttendance(String subject, String deviceId) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$subject.txt');

    List<String> attendanceList = [];
    if (await file.exists()) {
      attendanceList = await file.readAsLines();
    }

    if (!attendanceList.contains(deviceId)) {
      attendanceList.add(deviceId);
      await file.writeAsString(attendanceList.join('\n'));
    }

    setState(() {
      Attendance.attendanceData[subject] = attendanceList;
    });
  }

  void _onQRScanned(String? code) async {
    if (code != null) {
      List<String> qrParts = code.split('|');
      if (qrParts.length == 3) {
        String subject = qrParts[0];
        String deviceId = qrParts[1]; 
        await _saveAttendance(subject, deviceId);
        setState(() {
          scannedData = 'تم تسجيل الحضور للمادة: $subject';
        });
      }
    }
  }

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
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
                          MaterialPageRoute(builder: (context) => const StudentHome()),
                        );
                      },
                      child: Image.asset('images/back.png', width: 50, height: 50),
                    ),
                  ],
                ),
              ),
              Expanded(
  flex: 4,
  child: MobileScanner(
    controller: scannerController,
    onDetect: (barcodeCapture) {
      final List<Barcode> barcodes = barcodeCapture.barcodes;
      if (barcodes.isNotEmpty && barcodes.first.rawValue != null) {
        _onQRScanned(barcodes.first.rawValue!);
      }
    },
  ),
),

              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    scannedData ?? 'قم بمسح QR لتسجيل الحضور',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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