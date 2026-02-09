import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2), // ดันเนื้อหาลงมาจากด้านบน
            
            // หัวข้อหลัก
            const Text(
              'Body Health Calculator',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF535353),
              ),
            ),
            const SizedBox(height: 30),

            // รูปไอคอนตรงกลาง
            Image.asset(
              'assets/images/calculator.png', // เปลี่ยนเป็น path รูปของคุณ
              height: 150,
            ),
            const SizedBox(height: 30),

            // รายละเอียดบริการ
            const Text(
              'คำนวณหาค่าดัชนีมวลกาย (BMI)',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            const Text(
              'คำนวณหาค่าแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),

            const Spacer(flex: 2), // ดันเนื้อหาขึ้นไป

            // ส่วน Footer (โลโก้ และ ผู้พัฒนา)
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/4/47/Logosau-02.png', // เปลี่ยนเป็น path รูปโลโก้ของคุณ
              height: 80,
            ),
            const SizedBox(height: 15),
            const Text(
              'Developed by Kanyapat SAU 2026',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40), // ระยะห่างจาก Bottom Bar
          ],
        ),
      ),
      // Bottom Navigation Bar
      
    );
  }
}