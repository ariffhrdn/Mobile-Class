void main() { 
  int angka = 7;  
  if (angka <= 5) { 
    // Format sederhana untuk angka kecil 
    for (int i = 1; i <= 10; i++) { 
      print('$angka x $i = ${angka * i}'); 
    } 
  } else {
    print('Tabel perkalian $angka:'); 
    print('-------------------'); 
    for (int i = 1; i <= 10; i++) { 
      String hasil = '$angka x $i = ${angka * i}'; // Tambahkan highlight untuk hasil yang habis dibagi 2 
      if ((angka * i) % 2 == 0) { 
        print('$hasil (genap)'); } 
        else { print(hasil); } 
        } 
    }
  }
