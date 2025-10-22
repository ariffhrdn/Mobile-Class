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

/// Fungsi khusus untuk menghitung BMI
double bmiCalculation(double tinggiCm, double beratKg) {
  double tinggiM = tinggiCm / 100;
  return beratKg / (tinggiM * tinggiM);
}

void hitungBMI(double tinggiCm, double beratKg, List<Map<String, dynamic>> riwayat) {
  // Validasi input
  if (tinggiCm <= 0 || beratKg <= 0) {
    return;
  }

  // Konversi tinggi dari cm ke m
  double tinggiM = tinggiCm / 100;

  // Hitung BMI
  double bmi = beratKg / (tinggiM * tinggiM);
  // Hitung BMI menggunakan fungsi terpisah
  bmi = bmiCalculation(tinggiCm, beratKg);

  // Tentukan kategori menggunakan percabangan
  // Tentukan kategori
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