extends KinematicBody2D

const SPEED = 500 # Velocidade constante do player 02

var motion = Vector2() # Vetor 2 de movimentação
# Modo de jogo ("human" ou "cpu")
var mode = "cpu"

func _process(delta):
	# Se o modo for human, os controles pertencem ao jogador (W e A)
	if mode == "human":
		if Input.is_action_pressed("p2_up"):
			motion.y = -SPEED
		elif Input.is_action_pressed("p2_down"):
			motion.y = SPEED
		else:
			motion.y = 0
	# Se não, o CPU seguirá a posição Y da bola falsa (Inteligência artificial básica)
	else:
		position.y = get_node("../FakeBall").position.y
	
	# Movimenta jogador de acordo com o Vetor Motion
	move_and_slide(motion)