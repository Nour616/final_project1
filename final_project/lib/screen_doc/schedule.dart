import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class TeacherScheduleScreen extends StatefulWidget {
  const TeacherScheduleScreen({super.key});

  @override
  State<TeacherScheduleScreen> createState() => _TeacherScheduleScreenState();
}

class _TeacherScheduleScreenState extends State<TeacherScheduleScreen> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final savedFile = await _saveImageToLocalStorage(File(pickedFile.path));
      setState(() {
        _selectedImage = savedFile;
      });
    }
  }

  Future<File> _saveImageToLocalStorage(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    final File newImage = await imageFile.copy('$path/teacher_schedule.jpg');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('teacher_saved_image', newImage.path);

    return newImage;
  }

  Future<void> _loadSavedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedImagePath = prefs.getString('teacher_saved_image');

    if (savedImagePath != null) {
      setState(() {
        _selectedImage = File(savedImagePath);
      });
    }
  }

  Future<void> _clearImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('teacher_saved_image');
    setState(() {
      _selectedImage = null;
    });
  }

  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
  leading: Image.asset(
    "images/Vector.png",
    width: 30, // تحديد العرض
    height: 30, // تحديد الارتفاع
  ),
  title: const Text("اختر من المعرض"),
  onTap: () {
    Navigator.pop(context);
    _pickImage(ImageSource.gallery);
  },
)
            
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('images/backgroung.jpg', fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
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
                          Navigator.pop(context);
                        },
                        child: Image.asset('images/back.png', width: 50, height: 50),
                      ),
                    ],
                  ),
                  const Spacer(),
                  _selectedImage != null
                      ? Column(
                          children: [
                            Image.file(_selectedImage!, width: 300, height: 400, fit: BoxFit.cover),
                            const SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: _clearImage,
                              icon: const Icon(Icons.delete, color: Colors.white),
                              label: const Text("إزالة الجدول"),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            ),
                          ],
                        )
                      : ElevatedButton.icon(
                          onPressed: _showImagePicker,
                          icon: const Icon(Icons.add_photo_alternate, color: Colors.white),
                          label: const Text("إضافة الجدول"),
                        ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
