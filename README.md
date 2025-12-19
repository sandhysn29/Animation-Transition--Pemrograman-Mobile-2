# Animation & Transition – Flutter 🎬✨
---

Project ini merupakan implementasi **Animation dan Transition pada Flutter** yang dibuat untuk memenuhi tugas Mata Kuliah **Pemrograman Mobile 2**.

Aplikasi ini berfokus pada penerapan berbagai jenis animasi di Flutter, mulai dari **Implicit Animation**, **Explicit Animation**, **Interactive Animation**, hingga **Transisi Halaman**, dengan tujuan untuk memahami perbedaan konsep serta cara implementasinya secara langsung dalam satu project.

---

## 📁 Struktur Project

Struktur folder pada project ini disusun agar mudah dipahami dan terorganisir berdasarkan jenis implementasi animasi dan transisi.

<img width="256" height="222" alt="image" src="https://github.com/user-attachments/assets/14075817-c180-46e3-9b37-11962b1f50ff" />


Penjelasan singkat struktur folder utama:

- `lib/pages/`  
  Berisi halaman utama (Home Page) sebagai menu navigasi ke setiap contoh animasi.

- `lib/animations/`  
  Berisi implementasi berbagai jenis animasi, yaitu:
  - Implicit Animation
  - Explicit Animation
  - Interactive Animation

- `lib/transitions/`  
  Berisi implementasi custom page transition yang digunakan saat perpindahan halaman.

---

## 🎬 Implementasi Animation & Transition

### 1️⃣ Implicit Animation

**Implicit Animation** adalah jenis animasi di Flutter yang berjalan **secara otomatis** ketika terjadi perubahan nilai pada sebuah properti widget, tanpa perlu mengatur controller atau lifecycle animasi secara manual.

Pada implementasi ini, animasi dipicu oleh **interaksi pengguna (tombol ditekan)** yang mengubah ukuran dan warna sebuah widget, lalu Flutter akan menangani transisinya secara halus.

---

#### 🔧 Widget yang Digunakan
- `AnimatedContainer`
- `Duration`
- `Curves`
- `setState()`

---

#### 🧠 Konsep Singkat
Ketika nilai seperti `width`, `height`, atau `color` berubah di dalam `AnimatedContainer`, Flutter akan:
- Membandingkan nilai lama dan baru
- Menjalankan animasi secara otomatis dalam durasi tertentu
- Tanpa `AnimationController`

Dengan kata lain:  
**ubah nilai → animasi jalan sendiri**.

---

#### 💻 Rekap Kode Implementasi

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 500),
  curve: Curves.easeInOut,
  width: isExpanded ? 200 : 100,
  height: isExpanded ? 200 : 100,
  decoration: BoxDecoration(
    color: isExpanded ? Colors.blue : Colors.red,
    borderRadius: BorderRadius.circular(16),
  ),
)
```
---

#### 🎥 Hasil Implementasi
<p align="left">
  <img width="300" alt="image" src="https://github.com/user-attachments/assets/c74e221b-4c95-4fc0-bada-b013ebfc10fe" />
  <img width="300" alt="image" src="https://github.com/user-attachments/assets/cb952ec2-c693-44e9-83ad-9f64c3bac37e" />
</p>

#### 🎥 Video Animasi
https://github.com/user-attachments/assets/58e3aefe-c81a-4262-a0c4-bad54a962c7e

---

### 2️⃣ Explicit Animation

**Explicit Animation** adalah jenis animasi di Flutter yang memberikan kontrol penuh kepada developer terhadap jalannya animasi, seperti waktu mulai, berhenti, durasi, dan arah animasi, dengan menggunakan **AnimationController**.

Pada implementasi ini, animasi dijalankan secara eksplisit melalui controller untuk menggerakkan perubahan nilai (misalnya skala atau opacity) pada sebuah widget ketika pengguna melakukan interaksi.

---

#### 🔧 Widget yang Digunakan
- `AnimationController`
- `Animation<double>`
- `Tween`
- `AnimatedBuilder`
- `SingleTickerProviderStateMixin`

---

#### 🧠 Konsep Singkat
Berbeda dengan implicit animation, pada explicit animation:
- Developer mengatur controller animasi
- Animasi dijalankan secara manual (`orward`, `reverse`)
- Nilai animasi dihasilkan dari `Tween` dan dikontrol penuh

Alurnya secara sederhana:  
- Buat `AnimationController`
- Tentukan nilai awal dan akhir dengan `Tween`
- Jalankan animasi menggunakan controller

Dengan kata lain, **developer yang "memegang remote" animasinya.**

---

#### 💻 Rekap Kode Implementasi

```dart
_animationController = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 500),
);

_scaleAnimation = Tween<double>(
  begin: 1.0,
  end: 1.5,
).animate(_animationController);
```
```dart
AnimatedBuilder(
  animation: _scaleAnimation,
  builder: (context, child) {
    return Transform.scale(
      scale: _scaleAnimation.value,
      child: child,
    );
  },
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
  ),
)
```
---

#### 🎥 Hasil Implementasi
<p align="left">
<img width="300" alt="image" src="https://github.com/user-attachments/assets/25da6cb1-4637-4882-b7b7-7717c3514634" />
<img width="300"  alt="image" src="https://github.com/user-attachments/assets/884e3e32-4c0b-4fb8-9fb9-7b86da4ef693" />
</p>

#### 🎥 Video Animasi
https://github.com/user-attachments/assets/62f46d37-10e7-4ebe-b2f8-8973f297b549

---

### 3️⃣ Interactive Animation

**Interactive Animation** adalah animasi yang dipicu secara langsung oleh interaksi pengguna, seperti gesture sentuhan, drag, atau tap. Jenis animasi ini membuat pengguna tidak hanya melihat animasi, **tetapi ikut “mengendalikan” pergerakannya**.

Pada implementasi ini, animasi dijalankan berdasarkan gesture tap yang mengubah state widget, sehingga menghasilkan efek visual yang responsif terhadap aksi pengguna.

---

#### 🔧 Widget yang Digunakan
- `GestureDetector`
- `AnimatedContainerdouble>`
- `setState()`
- `Duration`
- `Curves`

---

#### 🧠 Konsep Singkat
Interactive animation menggabungkan:
- Input pengguna (gesture)
- Perubahan state
- Animasi sebagai respon langsung

Alurnya secara sederhana:  
- Pengguna melakukan gesture (tap)
- State berubah
- Widget melakukan animasi sebagai feedback visual

---

#### 💻 Rekap Kode Implementasi

```dart
GestureDetector(
  onTap: () {
    setState(() {
      isActive = !isActive;
    });
  },
  child: AnimatedContainer(
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
    width: isActive ? 180 : 100,
    height: isActive ? 180 : 100,
    decoration: BoxDecoration(
      color: isActive ? Colors.green : Colors.grey,
      borderRadius: BorderRadius.circular(20),
    ),
  ),
)
```

Ketika pengguna menekan widget, ukuran dan warna akan berubah secara animatif sebagai bentuk respon terhadap interaksi tersebut.

---

#### 🎥 Hasil Implementasi
<p align="left">
<img width="300" alt="image" src="https://github.com/user-attachments/assets/2e525d42-ebd0-43e4-b8bb-40ffe3268c84" />
<img width="300" alt="image" src="https://github.com/user-attachments/assets/3597c37e-8dd0-41e5-82a3-343aa4ae73fa" />
</p>

#### 🎥 Video Animasi
https://github.com/user-attachments/assets/c3699fbf-89e5-46db-934f-cd0f76808cd8

---

### 4️⃣ Page Transition (Custom Transition)

**Page Transition** merupakan teknik animasi yang digunakan saat terjadi **perpindahan antar halaman (navigation)** di Flutter. Dengan custom transition, perpindahan halaman tidak hanya berpindah secara instan, tetapi disertai efek animasi yang lebih halus dan menarik.

Pada implementasi ini, transisi halaman dibuat menggunakan animasi slide dengan arah tertentu saat berpindah dari satu halaman ke halaman lainnya.

---

#### 🔧 Widget yang Digunakan
- `Navigator`
- `PageRouteBuilder>`
- `Animation`
- `Tween`
- `SlideTransition`

---

#### 🧠 Konsep Singkat
Custom page transition bekerja dengan cara:
- Membuat route sendiri menggunakan `PageRouteBuilder`
- Mengatur animasi perpindahan halaman melalui parameter `transitionsBuilder`
- Menentukan arah dan jenis transisi menggunakan `Tween`

Alurnya secara sederhana:  
- Pengguna menekan tombol navigasi
- Route baru dibuat dengan animasi
- Halaman berpindah disertai efek transisi

---

#### 💻 Rekap Kode Implementasi

```dart
Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return const DetailPage();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  ),
);

```

Kode di atas menghasilkan efek slide dari kanan ke kiri saat berpindah halaman.

---

#### 🎥 Hasil Implementasi
https://github.com/user-attachments/assets/ae67b85e-edfe-4aa3-b3ab-c427aa486409

---

## 🧾 Kesimpulan

Melalui project ini, dapat disimpulkan bahwa Flutter menyediakan berbagai pendekatan dalam mengimplementasikan animasi dan transisi antarmuka, mulai dari yang sederhana hingga yang memberikan kontrol penuh kepada developer.

Setiap jenis animasi memiliki karakteristik dan kegunaan masing-masing:
- Implicit Animation cocok digunakan untuk animasi sederhana dengan konfigurasi minimal.
- Explicit Animation memberikan kontrol penuh terhadap alur animasi.
- Interactive Animation meningkatkan pengalaman pengguna melalui respon langsung terhadap interaksi.
- Page Transition memperkaya navigasi aplikasi dengan efek perpindahan halaman yang lebih halus dan menarik.

Dengan mengimplementasikan keempat konsep tersebut dalam satu project, pemahaman terhadap perbedaan konsep, alur kerja, serta penerapan animasi dan transisi pada Flutter dapat dipelajari secara langsung dan praktis.

---

## 👤 Identitas Mahasiswa
Project ini disusun untuk memenuhi Tugas Mata Kuliah Pemrograman Mobile 2.
- Nama: Sandhy Safarudin Nurdiansyah
- NPM: 23552011464
- Program Studi: Teknik Informatika
- Universitas: Universitas Teknologi Bandung
