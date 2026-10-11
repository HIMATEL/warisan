#games tebak angka
import random #digunakan untuk mengimport modul/library "random"

class GameTebakAngka :
    def __init__(self, batas_bawah, batas_atas, maks_percobaan):
        self.batas_bawah = batas_bawah
        self.batas_atas = batas_atas
        self.maks_percobaan = maks_percobaan
        self.angka_rahasia = random.randint(batas_bawah, batas_atas)
        #diatas merupakan parameter yang digunakan

    def main(self):
        percobaan = 0
        print(f"Tebak antara (self.batas_bawah) dan (self.batas_atas)")

        while percobaan < self.maks_percobaan :
            tebakan = int(input("Masukkan Angka Tebakan Anda : "))
            percobaan += 1

            if tebakan == self.angka_rahasia :
                print("Selamat anda berhasil menebak dengan benar!")
                break
            elif tebakan < self.angka_rahasia :
                print("Tebakan anda terlalu rendah.")
            else :
                print("Tebakan anda terlalu tinngi.")
                
        if percobaan == self.maks_percobaan :
            print(f"Maaf, anda gagal. angka yang benar adalah(self.angka_rahasia)")

game = GameTebakAngka(1,100,10)
game.main()
