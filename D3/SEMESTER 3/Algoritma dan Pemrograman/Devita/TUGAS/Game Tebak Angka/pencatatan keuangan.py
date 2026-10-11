import json  #json : javascript object nutation

#buat class untuk menyimpan detail keuangan
class Pengeluaran :
    def __init__(self, tanggal, jumlah, keterangan, kategori) :
        self.tanggal = tanggal
        self.jumlah = jumlah
        self.keterangan = keterangan
        self.kategori = kategori

    def __str__(self) :
        return (f"{self.tanggal}; Rp.{self.jumlah}; {self.keterangan}; kategori : {self.kategori}")
    
#kelas utama aplikasi unruk pencatatan pengeluaran keuangan
class AplikasiPencatatanPengeluaran :
    def __init__(self) :
        self.daftar_pengeluaran = self.muat_data()

#fungsi unruk meload/memuat data dari json file
    def muat_data(self) :
        try :
            with open ("data_pengeluaran.json", "r") as file :
               data = json.load(file)
               return [Pengeluaran (**d) for d in data]
        except FileNotFoundError :
            return [] 

#fungsi untuk save/menyimpan data ke json file     
    def simpan_data(self) :
        with open ("data_pengeluaran.json", "w") as file :
            data = [vars(p) for p in self.daftar_pengeluaran]
            json.dump(data, file, indent = 4)

#fungsi pengeluaran
    def tambah_pengeluaran(self, tanggal, jumlah, keterangan, kategori) :
        pengeluaran_baru = Pengeluaran(tanggal, jumlah, keterangan, kategori)
        self.daftar_pengeluaran.append(pengeluaran_baru)
        self.simpan_data()
        print("Pengeluaran berhasil ditambahkan!")

#fungsi menampilkan seluruh pengeluaran
    def tampilkan_pengeluaran(self) :
        if not self.daftar_pengeluaran :
            print("Belum ada pengeluaran.")
            return
        for pengeluaran in self.daftar_pengeluaran :
            print(pengeluaran)

#fungsi hapus pengeluaran
    def hapus_pengeluaran(self, index) :
        if index <0 or index >= len(self.daftar_pengeluaran):
            print("Index tidak valid.")
            return
        del self.daftar_pengeluaran[index]
        self.simpan_data()
        print("Pengeluaran berhasil dihapus")

def jalankan_aplikasi() :
    app = AplikasiPencatatanPengeluaran()

    while True :
        print("\nMenu Aplikasi Pencatatan Pengeluaran Keuangan")
        print("1. Tambah Pengeluaran")
        print("2. Tampilkan Pengeluaran")
        print("3. Hasil Pengeluaran")
        print("4. Keluar")
        pilihan = input("Masukkan Pilihan Anda : ")

        if pilihan == "1":
            tanggal = input("Masukkan tanggal (DD/MM/YYYY)")
            jumlah = float(input("Masukkan Jumlah Pengeluaran : Rp."))
            keterangan = input("Masukkan keterangan")
            kategori = input("Masukkan kategori pengeluaran")
                
            app.tambah_pengeluaran(tanggal, jumlah, keterangan, kategori)

        elif pilihan == "2" :
            app.tampilkan_pengeluaran()

        elif pilihan == "3" :
            try :
                index = int(input("Masukkan index yang akan dihapus"))
                app.hapus_pengeluaran(index)
            except ValueError :
                print("Masukkan nomor index yang valid")

        elif pilihan == "4" :
            print("Keluar Aplikasi")
            break
        else :
            print("Pilihan tidak valid")

app = AplikasiPencatatanPengeluaran()
app.muat_data()
app.simpan_data()
app.tambah_pengeluaran(1000, 100, "kas", "masuk")
app.tampilkan_pengeluaran()
app.hapus_pengeluaran(1)
app.tampilkan_pengeluaran()