**Materi Belajar Ujian Sistem Komunikasi Serat Optik (SKSO)**

---

### 1. Blok Diagram Pemancar dan Penerima Serat Optik (Pendekatan Dosen)

#### Pemancar (Transmitter):
Input: Sinyal data elektrik

**a. Penguat Tegangan (Voltage Amplifier)**
- Meningkatkan level tegangan dari sinyal elektrik agar cukup kuat untuk mengendalikan penguat arus.

**b. Penguat Arus (Current Amplifier / Driver Circuit)**
- Bertugas mengendalikan arus ke LED atau Laser Diode.
- Ya, ini disebut juga sebagai driver.
- Mengatur seberapa besar arus yang masuk ke dioda agar dioda memancarkan cahaya dengan intensitas sesuai sinyal.

**c. Sumber Cahaya (LED / Laser Diode)**
- Mengubah sinyal listrik menjadi cahaya optik.
- LED: lebih murah, spektrum lebih lebar, daya lebih kecil.
- LD (Laser Diode): koherensi tinggi, daya lebih kuat, cocok untuk jarak jauh.

Output: Cahaya optik dikirim melalui fiber.

#### Penerima (Receiver):
Input: Cahaya dari fiber

**a. Photodiode**
- Mengubah cahaya optik menjadi arus listrik.
- Biasanya menggunakan PIN atau APD (Avalanche Photodiode).

**b. Penguat Arus**
- Meningkatkan arus lemah dari photodiode agar cukup untuk diubah menjadi tegangan.

**c. Penguat Tegangan**
- Mengubah sinyal arus menjadi sinyal tegangan elektrik dan memperkuatnya agar siap diproses oleh perangkat elektronik.

Output: Sinyal elektrik keluar dari sistem optik.

---

### 2. Mengapa Sinyal Informasi SKSO dalam Bentuk Digital

- LED dan Laser Diode adalah komponen semikonduktor yang bekerja optimal dalam kondisi **forward bias**.
- Pada forward bias, mereka hanya memiliki dua kondisi:
  - ON (menyala saat dialiri arus)
  - OFF (mati saat tidak dialiri arus)
- Sifat ini sangat cocok untuk sistem **digital (biner)**: 1 (cahaya ada) dan 0 (cahaya tidak ada).
- Jika digunakan untuk sinyal analog (kontinu), maka pengendalian intensitas cahaya akan sulit dan tidak efisien karena:
  - Tidak linier
  - Tidak akurat
  - Mudah terganggu oleh noise
- Oleh karena itu, SKSO lebih cocok untuk membawa **sinyal digital**, misalnya sinyal data dari komputer, internet, video digital, dsb.

---

### 3. Fresnel Loss

**Fresnel Loss** adalah kehilangan daya cahaya akibat pantulan (refleksi) sebagian cahaya pada batas antara dua medium berbeda indeks biasnya.

#### a. Jika Menggunakan Connector:
- Ada celah udara antara dua ujung fiber → perubahan indeks bias dari kaca ke udara.
- Pantulan tinggi terjadi → Fresnel loss bisa 0.3–1 dB per koneksi.

#### b. Jika Menggunakan Splicing (Fusion Splice):
- Dua ujung fiber dilelehkan dan disambung permanen → tidak ada celah udara.
- Indeks bias hampir sama → pantulan minimal → Fresnel loss < 0.1 dB.

Cara mengurangi:
- Gunakan splicing
- Gunakan gel indeks bias di konektor
- Potong miring ujung fiber (APC)

---

### 4. Istilah Penting dalam SKSO

**a. Power Budget:**
Jumlah maksimum kehilangan daya (loss) yang masih dapat diterima dalam sistem agar sinyal tetap diterima dengan baik.

**b. Connector:**
Alat penyambung sementara antar dua ujung fiber optik.

**c. Splice:**
Penyambungan permanen antar dua ujung fiber, biasanya dengan fusion splice.

**d. Link Loss:**
Total redaman (loss) dari seluruh link fiber, termasuk loss dari fiber itu sendiri, splice, connector, dll.

**e. Margin:**
Selisih antara power budget dan total link loss, sebagai cadangan (safety factor).

**f. Power Meter Optik:**
Alat untuk mengukur daya optik (dBm) yang keluar dari fiber.

**g. Receiver Sensitivity:**
Tingkat daya minimum yang dapat diterima oleh penerima untuk mendeteksi sinyal dengan benar.

---

### 5. Pengujian Jaringan SKSO sebagai Backbone End-to-End

**a. Apa itu Backbone?**
Backbone adalah jalur utama jaringan dengan kapasitas besar, menghubungkan pusat-pusat komunikasi seperti server atau BTS.

**b. Apa itu Konfigurasi End-to-End?**
Menghubungkan dua titik ujung secara langsung untuk menguji kualitas sinyal sepanjang jalur fiber secara menyeluruh.

**c. Langkah Pengujian End-to-End:**
1. Siapkan alat: Light Source, Optical Power Meter (OPM), OTDR (opsional).
2. Tentukan dua titik ujung fiber.
3. Cek dokumentasi (panjang kabel, jumlah sambungan, dll).
4. Kirim sinyal dari satu ujung dengan light source.
5. Ukur sinyal di ujung lainnya dengan OPM.
6. Hitung total loss, bandingkan dengan power budget.
7. Gunakan OTDR jika ingin lihat lokasi loss.
8. Dokumentasikan hasil pengujian.

Tujuannya memastikan sistem siap digunakan dan sesuai standar kualitas.

