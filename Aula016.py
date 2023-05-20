velocidade = 61
local_carro = 100

RADAR_1 = 60
LOCAL_1 = 100
RADAR_RANGE = 1
velocidade_carro_páss_radar_1 = velocidade > RADAR_RANGE
carro_multado_radar_1 = local_carro >= (LOCAL_1 - RADAR_RANGE) and local_carro <= (LOCAL_1 + RADAR_RANGE)

if velocidade_carro_páss_radar_1:
    print("Passou do radar 1")

if carro_multado_radar_1 and velocidade_carro_páss_radar_1:
    print("Carro multado")