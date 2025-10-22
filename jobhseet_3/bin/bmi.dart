// Fungsi untuk menghitung BMI (logika kalkulasi)
double bmiCalculation(double tinggiCm, double beratKg) {
  // Ubah tinggi dari cm ke meter
  double tinggiM = tinggiCm / 100;
  // Rumus BMI: berat / (tinggi * tinggi)
  return beratKg / (tinggiM * tinggiM);
}

// Fungsi untuk memvalidasi, menghitung, dan menyimpan BMI
void hitungBMI(double tinggiCm, double beratKg, List<Map<String, dynamic>> riwayat) {
  // Validasi input
  if (tinggiCm <= 0 || beratKg <= 0) {
    print("⚠️ Input tidak valid: Tinggi ($tinggiCm cm) dan Berat ($beratKg kg) harus positif.");
    return;
  }

  // Hitung BMI menggunakan fungsi terpisah
  double bmi = bmiCalculation(tinggiCm, beratKg);

  // Tentukan kategori
  String kategori;
  if (bmi < 18.5) {
    kategori = "Kekurangan berat badan";
  } else if (bmi < 25) {
    kategori = "Normal (ideal)";
  } else if (bmi < 30) {
    kategori = "Kelebihan berat badan";
  } else {
    kategori = "Obesitas";
  }

  // Simpan hasil ke history
  tambahHistory(riwayat, tinggiCm, beratKg, bmi, kategori);
}

void main() {
  List<Map<String, dynamic>> riwayat = [];

  // Simulasi beberapa input
  hitungBMI(170, 65, riwayat);    // valid
  hitungBMI(165, -75, riwayat);  // tidak valid (berat negatif)
  hitungBMI(0, 70, riwayat);      // tidak valid (tinggi 0)
  hitungBMI(165, -75, riwayat);  // tidak valid
  hitungBMI(0, 70, riwayat);      // tidak valid
  hitungBMI(180, 85, riwayat);    // valid

  // Tampilkan riwayat menggunakan perulangan
  print("\n=== History Awal ===");
  tampilkanRiwayat(riwayat);

  // Hapus 1 riwayat
  hapusHistory(riwayat, 0);

  print("\n=== Setelah Hapus Index 0 ===");
  tampilkanRiwayat(riwayat);

  // Clear semua riwayat
  clearHistory(riwayat);

  print("\n=== Setelah Clear History ===");
  tampilkanRiwayat(riwayat);
}

/// Tambah data ke history
void tambahHistory(List<Map<String, dynamic>> riwayat,
    double tinggi, double berat, double bmi, String kategori) {
  riwayat.add({
    // ❌ KESALAHAN SEBELUMNYA:
    // 'tinggi': tinggiCm, // Error: Variabel tidak dikenal (out of scope)
    // 'berat': beratKg,   // Error: Variabel tidak dikenal
    // 'tinggi': tinggi,   // Error: Key 'tinggi' duplikat
    // 'berat': berat,     // Error: Key 'berat' duplikat
    
    // ✅ PERBAIKAN:
    'tinggi': tinggi,
    'berat': berat,
    'bmi': bmi,
    'kategori': kategori,
  });
}

/// Hapus 1 data history berdasarkan index
void hapusHistory(List<Map<String, dynamic>> riwayat, int index) {
  if (index < 0 || index >= riwayat.length) {
    print("⚠️ Index tidak valid!");
    return;
  }
  riwayat.removeAt(index);
  print("✅ History pada index $index berhasil dihapus.");
}

/// Clear seluruh history
void clearHistory(List<Map<String, dynamic>> riwayat) {
  riwayat.clear();
  print("🗑️ Semua history telah dihapus.");
}

/// Tampilkan seluruh history
void tampilkanRiwayat(List<Map<String, dynamic>> riwayat) {
  if (riwayat.isEmpty) {
    print("Riwayat masih kosong.");
    return;
  }

  // ❌ KESALAHAN SEBELUMNYA: Ada loop 'for...in' di luar loop 'for...i'
  // for (var data in riwayat) { 

  // ✅ PERBAIKAN: Cukup satu loop 'for...i' untuk mendapatkan index
  for (int i = 0; i < riwayat.length; i++) {
    var data = riwayat[i];
    print(
      // ❌ KESALAHAN SEBELUMNYA: Format string ganda
      // "Tinggi: ${data['tinggi']} cm, Berat: ${data['berat']} kg, " 
      "[$i] Tinggi: ${data['tinggi']} cm, Berat: ${data['berat']} kg, "
      "BMI: ${data['bmi'].toStringAsFixed(2)}, Kategori: ${data['kategori']}",
    );
  }
  // } // Penutup loop 'for...in' yang salah
}