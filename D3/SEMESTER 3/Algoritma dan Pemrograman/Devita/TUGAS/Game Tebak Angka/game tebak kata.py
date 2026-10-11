import random

class GameTebakKata:
    def __init__(self, level):
        self.level = level
        self.kata_rahasia = self.pilih_kata()
        self.kesempatan = self.tentukan_kesempatan()

    def pilih_kata(self):
        kata_mudah = ['apel', 'jeruk', 'anggur', 'pisang']
        kata_sedang = ['komputer', 'internet', 'python', 'programmer']
        kata_sulit = ['hipopotamus', 'elefantis', 'gajah', 'kanguru']

        if self.level == 'mudah':
            return random.choice(kata_mudah)
        elif self.level == 'sedang':
            return random.choice(kata_sedang)
        elif self.level == 'sulit':
            return random.choice(kata_sulit)
        else:
            raise ValueError("Level tidak valid")

    def tentukan_kesempatan(self):
        if self.level == 'mudah':
            return 5
        elif self.level == 'sedang':
            return 4
        elif self.level == 'sulit':
            return 3
        else:
            raise ValueError("Level tidak valid")

    def main(self):
        print(f"Selamat datang di Game Tebak Kata level {self.level}")
        print(f"Anda memiliki {self.kesempatan} kesempatan.")

        while self.kesempatan > 0:
            tebakan = input("Masukkan tebakan kata: ").lower()

            if tebakan == self.kata_rahasia:
                print("Selamat! Anda berhasil menebak kata.")
                break
            else:
                self.kesempatan -= 1
                print(f"Jawaban salah. Kesempatan Anda tinggal {self.kesempatan}.")

        if self.kesempatan == 0:
            print(f"Sayang sekali! Kesempatan Anda habis. Kata yang benar adalah '{self.kata_rahasia}'.")

# Main program
game = GameTebakKata(level='mudah')  # Pemain memilih level kesulitan
game.main()
