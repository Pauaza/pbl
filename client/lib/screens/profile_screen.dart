import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF22A9D6), // Warna biru header
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ===================== HEADER BIRU =====================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
              decoration: const BoxDecoration(
                color: Color(0xFF22A9D6),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Informasi Profil",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Data diri pegawai",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Image.asset(
                    'assets/logoPbl.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),

            // ===================== FORM BODY (PUTIH MELENGKUNG) =====================
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _ProfileField(title: "Nama Panjang", value: "John"),
                    const _ProfileField(title: "Email", value: "JohnDoe@gmail.com"),
                    const _ProfileField(title: "Jenis Kelamin", value: "Pria"),
                    const _ProfileField(
                        title: "Alamat",
                        value: "Jalan Jakarta no. 10, Jakarta Indonesia"),
                    const _ProfileField(
                        title: "Jabatan", value: "Front-End Developer"),
                    const _ProfileField(
                        title: "Departemen", value: "Teknologi Informasi"),

                    // Jatah Cuti Warna Khusus
                    const _ProfileField(
                      title: "Jatah Cuti",
                      value: "4",
                      color: Color(0x66D79A20),
                    ),

                    const SizedBox(height: 24),

                    // ===================== TOMBOL DI DALAM BACKGROUND PUTIH =====================
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CB050),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          "Informasi Gaji",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===================== CUSTOM FIELD =====================
class _ProfileField extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const _ProfileField({
    super.key,
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),

        TextField(
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: color ?? const Color(0xfff1f1f1),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintText: value,
            hintStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}