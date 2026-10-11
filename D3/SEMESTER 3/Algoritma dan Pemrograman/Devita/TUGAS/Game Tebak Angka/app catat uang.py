import json #json : javascript object notation

class Pengeluaran:
    def _init_(self, tanggal, jumlah, keterangan, kategori):
        self.tanggal = tanggal
        self.jumlah = jumlah
        self.keterangan = keterangan
        self.kategori = kategori

    def _str_(self):
        return (f"{self.tanggal} - Rp.{self.jumlah} - {self.keterangan} - Kategori : {self.kategori}")

#kelas utama aplikasi untuk pencatatan pengeluaran
class AplikasiPencatatanPengeluaran:
    def _init_(self):
        self.daftar_pengeluaran = self.muat_data()
    #fungsi untuk memuat data dari json file
    def muat_data(self):
        try:
            with open ("data_pengeluaran.json","r") as file:
                data = json.load(file)
                return [Pengeluaran (**d) for d in data]
        except FileNotFoundError:
            return []
    #fungsi untuk menyimpan data ke json file
    def simpan_data(self):
        with open ("data_pengeluaran.json", "w") as file:
            data = [vars (p) for p in self.daftar_pengeluaran]
            json.dump(data, file, indent = 4)

    #fungsi pengeluaran
    def tambah_pengeluaran(self, tanggal, jumlah, keterangan, kategori):
        pengeluaran_baru = Pengeluaran(tanggal, jumlah, keterangan, kategori)
        self.daftar_pengeluaran.append(pengeluaran_baru)
        self.simpan_data()
        print("Pengeluaran berhasil ditambahkan")

    #fungsi menampilkan seluruh pengeluaran
    def tampilkan_pengeluaran(self):
        if not self.daftar_pengeluaran:
            print("Belum ada pengeluaran")
            return
        for pengeluaran in self.daftar_pengeluaran:
            print(pengeluaran)

    #fungsi hapus pengeluaran
    def hapus_pengeluaran(self, index):
        if index < 0 or index >= len(self.daftar_pengeluaran):
            print("Index tidak valid")
            return
        del self.daftar_pengeluaran[index]
        self.simpan_data()
        print("Pengeluaran berhasil dihapus")

def jalankan_aplikasi():
    app = AplikasiPencatatanPengeluaran()
    while True:
        print("\nMenu Aplikasi Pencatatan Pengeluaran Keuangan")
        print("1: Tambah Pengeluaran")
        print("2: Tampilkan Pengeluaran")
        print("3: Hapus Pengeluaran")
        print("4: Keluar")
        pilihan = input("Masukkan Pilihan Anda: ")

        if pilihan == "1":
            tanggal = input("Masukkan tanggal (dd/mm/yyyy)")
            jumlah = float(input("Masukkan jumlah pengeluaran : Rp"))
            keterangan = input("Masukkan keterangan : ")
            kategori = input("Masukkan kategori pengeluaran ")
            app.tambah_pengeluaran(tanggal, jumlah, keterangan, kategori)
        elif pilihan == "2":
            app.tampilkan_pengeluaran()
        elif pilihan == "3":
            try:
                index = int(input("Masukkan index yang akan dihapus! "))
                app.hapus_pengeluaran(index)
            except ValueError:
                print("Masukkan nomor index yang valid!")
        elif pilihan == "4":
            print("Keluar aplikasi")
            break
        else:
            print("Pilihan tidak valid")

#menjalankan aplikasi
jalankan_aplikasi()
app = AplikasiPencatatanPengeluaran()