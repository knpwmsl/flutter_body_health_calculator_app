import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  // 1. ตัวควบคุมการกรอกข้อมูล
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  // 2. ตัวแปรสำหรับคำนวณ
  String gender = 'male'; 
  double bmrValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'คำนวณอัตราการเผาผลาญพื้นฐาน\n(BMR)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF424242)),
            ),
            const SizedBox(height: 20),
            
            // รูปภาพประกอบ
            Image.asset(
              'assets/images/bmr.png', 
              height: 120,
            ),
            const SizedBox(height: 10),

            // ส่วนเลือกเพศ
            _buildInputLabel('เพศ'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                Radio(
                  value: 'male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() { gender = value.toString(); });
                  },
                ),
                const Text('ชาย'),
                const SizedBox(width: 100), // ปรับระยะห่างให้พอดีหน้าจอ
                Radio(
                  value: 'female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() { gender = value.toString(); });
                  },
                ),
                const Text('หญิง'),
              ],
            ),

            const SizedBox(height: 10),
            _buildInputLabel('น้ำหนัก (kg.)'),
            _buildTextField(wCtrl, 'กรอกน้ำหนักของคุณ'),
            
            const SizedBox(height: 15),
            _buildInputLabel('ส่วนสูง (cm.)'),
            _buildTextField(hCtrl, 'กรอกส่วนสูงของคุณ'),

            const SizedBox(height: 15),
            _buildInputLabel('อายุ (ปี)'),
            _buildTextField(ageCtrl, 'กรอกอายุของคุณ'),

            const SizedBox(height: 30),

            // ปุ่มคำนวณสีเขียว (ตามโค้ดล่าสุดของคุณ)
            ElevatedButton(
              onPressed: () {
                // แก้ไขจุดที่ Error: ปรับการเช็คค่าว่างให้ถูกต้อง
                if (wCtrl.text.isEmpty || hCtrl.text.isEmpty || ageCtrl.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                double w = double.parse(wCtrl.text);
                double h = double.parse(hCtrl.text);
                double age = double.parse(ageCtrl.text);
                
                setState(() {
                  if (gender == 'male') {
                    bmrValue = 66 + (13.7 * w) + (5 * h) - (6.8 * age);
                  } else {
                    bmrValue = 665 + (9.6 * w) + (1.8 * h) - (4.7 * age);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[500], 
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('คำนวณ BMR', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            
            const SizedBox(height: 15),

            // ปุ่มล้างข้อมูลสีเทา
            ElevatedButton(
              onPressed: () {
                setState(() {
                  wCtrl.clear();
                  hCtrl.clear();
                  ageCtrl.clear();
                  bmrValue = 0.0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400],
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('ล้างข้อมูล', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),

            const SizedBox(height: 30),
            
            // กล่องแสดงผล
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Text('BMR', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(
                    bmrValue.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 45, color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const Text('kcal/day', style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController ctrl, String hint) {
    return TextField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }

  Widget _buildInputLabel(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}