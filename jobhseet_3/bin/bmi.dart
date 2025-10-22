void main() {
  List<Map<String, dynamic>> riwayat = [];

  // Simulasi beberapa input
  hitungBMI(170, 65, riwayat);   // valid
  hitungBMI(165, -75, riwayat);  // tidak valid (berat negatif)
  hitungBMI(0, 70, riwayat);     // tidak valid (tinggi 0)
  hitungBMI(180, 85, riwayat);   // valid

  // Tampilkan riwayat menggunakan perulangan
  tampilkanRiwayat(riwayat);
}

void hitungBMI(double tinggiCm, double beratKg, List<Map<String, dynamic>> riwayat) {
  // Validasi input
  if (tinggiCm <= 0 || beratKg <= 0) {
    print("❌ Input tidak valid! Tinggi dan berat harus lebih dari 0.");
    return;
  }

  if (tinggiCm < 50 || tinggiCm > 300) {
    print("❌ Input tinggi tidak masuk akal: $tinggiCm cm");
    return;
  }

  if (beratKg < 10 || beratKg > 500) {
    print("❌ Input berat tidak masuk akal: $beratKg kg");
    return;
  }

  // Konversi tinggi dari cm ke m
  double tinggiM = tinggiCm / 100;

  // Hitung BMI
  double bmi = beratKg / (tinggiM * tinggiM);

  // Tentukan kategori menggunakan percabangan
  String kategori;
  if (bmi < 18.5) {
    kategori = "Kurus";
  } else if (bmi < 25) {
    kategori = "Normal";
  } else if (bmi < 30) {
    kategori = "Gemuk";
  } else {
    kategori = "Obesitas";
  }

  // Simpan hasil ke riwayat
  riwayat.add({
    'tinggi': tinggiCm,
    'berat': beratKg,
    'bmi': bmi,
    'kategori': kategori,
  });
}

void tampilkanRiwayat(List<Map<String, dynamic>> riwayat) {
  if (riwayat.isEmpty) {
    print("Riwayat masih kosong.");
    return;
  }

  for (var data in riwayat) {
    print(
      "Tinggi: ${data['tinggi']} cm, Berat: ${data['berat']} kg, "
      "BMI: ${data['bmi'].toStringAsFixed(2)}, Kategori: ${data['kategori']}",
    );
  }
}