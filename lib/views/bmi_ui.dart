import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  // 1. ประกาศ Controller ไว้ภายใน State เพื่อการจัดการที่ถูกต้อง
  TextEditingController wctrl = TextEditingController();
  TextEditingController hctrl = TextEditingController();

  // 2. ตัวแปรเก็บค่า BMI
  double bmivalue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/bmi.png', // ตรวจสอบว่ามีไฟล์นี้ใน pubspec.yaml
                height: 150,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 150, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              
              _buildInputLabel('น้ำหนัก (kg.)'),
              TextField(
                controller: wctrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'กรอกน้ำหนักของคุณ',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),

              _buildInputLabel('ส่วนสูง (cm.)'),
              TextField(
                controller: hctrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'กรอกส่วนสูงของคุณ',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 30),

              // ปุ่มคำนวณ BMI (ย้าย Logic มาไว้ที่นี่)
              ElevatedButton(
                onPressed: () {
                  if (wctrl.text.isEmpty || hctrl.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  
                  double w = double.parse(wctrl.text);
                  double h = double.parse(hctrl.text) / 100;

                  setState(() {
                    bmivalue = w / (h * h);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[500],
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('คำนวณ BMI', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 15),

              // ปุ่มล้างข้อมูล
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    wctrl.clear();
                    hctrl.clear();
                    bmivalue = 0.0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('ล้างข้อมูล', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 40),

              // ส่วนแสดงผลลัพธ์
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Text('BMI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                      bmivalue.toStringAsFixed(2), // แสดงทศนิยม 2 ตำแหน่ง
                      style: const TextStyle(fontSize: 45, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}