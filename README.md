# Panduan Membuat New Project Flutter Pada VSCODE
1. Buka VsCode
2. Pilih menu File dan Pilih Open Folder
3. Buat Folder Untuk Menyimpan Projek Pada PC (Bebas Lokasi)
4. Setelah folder jadi akan otomatis masuk ke dalam VsCode
5. Pada tengah atas ketik > dan pilih Flutter New Project, Kemudian Pilih Application. Tunggu Selesai Load
6. Done, Siapkan Firebasenya sekarang.
---
# Panduan Konfigurasi Firebase Realtime Database
Dokumentasi ini menjelaskan langkah-langkah untuk menyiapkan Firebase Realtime Database pada proyek 

## 🚀 Langkah-Langkah Persiapan

### 1. Akses Console
Buka [Firebase Console](https://console.firebase.google.com/) 
Klik Create New Firebase Project

### 2. Mengaktifkan Database
* Pada sidebar navigasi di sisi kiri, perluas menu **Build**.
* Pilih **Realtime Database**.
* Klik tombol **Create Database** untuk memulai alur kerja pembuatan database.

### 3. Pengaturan Lokasi & Keamanan
Selama proses pembuatan, Anda akan diminta untuk mengonfigurasi hal berikut:

* **Pilih Lokasi:** Pilih server yang paling dekat dengan lokasi pengguna Anda (misalnya: `asia-southeast1` untuk wilayah Singapura/Indonesia) guna memastikan latensi yang rendah.
* **Mode Aturan Keamanan (Security Rules):**
    * **Test Mode:** Memungkinkan akses baca dan tulis secara publik. Cocok untuk tahap pengembangan awal. *Penting: Perbarui aturan ini sebelum aplikasi dipublikasikan.*
    * **Locked Mode:** Menolak semua akses dari klien luar. Hanya server yang terautentikasi yang dapat mengakses data.

### 4. Finalisasi
Klik **Done** atau **Create**. Setelah aktif, Firebase juga akan secara otomatis mengaktifkan API yang sesuai pada Google Cloud API Manager.

---

---

## 🛠️ BAGIAN 3: Instalasi Firebase CLI & FlutterFire CLI

Setelah setup di Firebase Console selesai, kita perlu menginstal alat baris perintah (CLI) untuk menghubungkan proyek lokal dengan akun Firebase.

### 1. Prasyarat: Node.js
Firebase CLI membutuhkan **Node.js**. 
* **Cek Instalasi:** Buka terminal VS Code dan ketik `node -v`. 
* Jika belum ada, unduh di: [nodejs.org](https://nodejs.org/)

### 2. Instalasi Firebase CLI
Jalankan perintah ini di terminal untuk menginstal paket secara global:
```bash
npm install -g firebase-tools
```

### 3. Login ke Akun Firebase
Hubungkan terminal dengan akun Google Anda:

```Bash
firebase login
```

## ⚙️ 2. Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

---

## 🔥 4. Hubungkan Firebase ke Project Flutter

1. Masuk ke Direktori Root Proyek
Cari dlu path projek dimana, terus command CD
Pastikan terminal Anda berada di folder utama proyek (folder yang berisi file pubspec.yaml).

```Bash
cd "C:\Path\Ke\Folder\Proyek\Anda"
```
Setelah menemukan lokasi projek jalankan:

```bash
flutterfire configure
```

Langkah ini akan:

* Menghubungkan project ke Firebase
* Membuat file konfigurasi:

```
lib/firebase_options.dart
```

---

## 📦 5. Install Dependency Flutter

Tambahkan ke `pubspec.yaml`:
```bash
 flutter pub add firebase_core
```

```bash
flutter pub add firebase_database
```

Maka di pubspec.yaml akan menjadi :
```yaml
dependencies:
  flutter:
    sdk: flutter

  firebase_core: ^3.15.2
  firebase_auth: ^5.3.3
```

Kemudian jalankan:

```bash
flutter pub get
```

---

## 🔌 6. Inisialisasi Firebase
Inisialisasi Kode di main.dart
Buka file lib/main.dart dan tambahkan kode inisialisasi Firebase agar siap digunakan saat aplikasi dimulai:

```dart
Dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import ini sangat penting!

void main() async {
  // Pastikan binding framework sudah siap
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}
```
