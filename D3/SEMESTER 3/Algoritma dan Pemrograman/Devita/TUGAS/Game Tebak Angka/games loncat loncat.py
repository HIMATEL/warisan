import pygame
import sys

# Inisialisasi Pygame
pygame.init()

# Ukuran layar
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600

# Warna
WHITE = (255, 255, 255)
RED = (255, 0, 0)

# Inisialisasi layar
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("Simple Jumping Game")

# Inisialisasi pemain
player_width = 50
player_height = 50
player_x = SCREEN_WIDTH // 2 - player_width // 2
player_y = SCREEN_HEIGHT - player_height

player_speed = 5
jump_count = 10
is_jumping = False

# Loop game
while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

    keys = pygame.key.get_pressed()
    
    # Pindahkan pemain ke kiri
    if keys[pygame.K_LEFT] and player_x > player_speed:
        player_x -= player_speed

    # Pindahkan pemain ke kanan
    if keys[pygame.K_RIGHT] and player_x < SCREEN_WIDTH - player_width - player_speed:
        player_x += player_speed

    # Lompat
    if not is_jumping:
        if keys[pygame.K_SPACE]:
            is_jumping = True
    else:
        if jump_count >= -10:
            neg = 1
            if jump_count < 0:
                neg = -1
            player_y -= (jump_count ** 2) * 0.5 * neg
            jump_count -= 1
        else:
            is_jumping = False
            jump_count = 10

    # Hapus layar
    screen.fill(WHITE)

    # Gambar pemain
    pygame.draw.rect(screen, RED, (player_x, player_y, player_width, player_height))

    # Update layar
    pygame.display.flip()

    # Kontrol kecepatan frame
    pygame.time.Clock().tick(30)  