extends KinematicBody2D

# Armazenamento do som de colisão na variável "collision_sfx"
onready var collision_sfx = load("res://Assets/SFX/collision1.ogg")

# Armazenamento do som de derrota na variável "lose_sfx"
onready var lose_sfx = load("res://Assets/SFX/lose.ogg")

# Constante de normalização para detecção de paredes/chão/teto.
const NORMAL = Vector2(0, -1)

export var speed = 250 # Variável de velocidade. Como export pois pode ser alterada nas propriedades do node.

# Vetor 2 de movimentação
var motion = Vector2()
var start_pos # Variável para armazenar a posição inicial da bola.

func _ready():
	# Salvar a posição inicial da bola:
	start_pos = get_global_position()
	
	# Setar os dois valores do Vetor de movimentação como a velocidade padrão da bola
	motion = Vector2(speed, speed)

func _process(delta):
	# Se encostar no teto ou no chão:
	if is_on_ceiling() or is_on_floor():
		motion.y *= -1 # Inverte a velocidade vertical
		if is_visible_in_tree(): # Se estiver visível (por conta da "fake ball"), toca o som.
			$SFX.stream = collision_sfx
			$SFX.play()
	# Se não encostar no teto ou chão mas encostar na parede:
	elif is_on_wall():
		motion.x *= -1 # Inverte velocidade horizontal
		if is_visible_in_tree(): # Se estiver visível (por conta da "fake ball"), toca o som.
			$SFX.stream = collision_sfx
			$SFX.play()
	
	# Se o timer de delay para resetar a partida não estiver rodando:
	if $Delay.is_stopped():
		# Bola é movimentada
		move_and_slide(motion, NORMAL)

# Toda vez que o timer "Addspeed" terminar, aumentamos a velocidade da bola
func increase_speed():
	# Se ela estiver com velocidade positiva, aumentamos 20.
	if motion.x > 0:
		motion.x += 20
		motion.y += 20
	# Se não, diminuímos 20.
	else:
		motion.y -= 20
		motion.x -= 20
