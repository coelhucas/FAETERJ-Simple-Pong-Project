extends KinematicBody2D

const SPEED = 500 # Velocidade constante do player 01

var motion = Vector2() # Vetor 2 de movimentação

func _process(delta):
	# Se apertar para cima, diminuímos o eixo Y da movimentação.
	if Input.is_action_pressed("ui_up"):
		motion.y = -SPEED
	# Se apertar para baixo, aumentamos o eixo Y.
	elif Input.is_action_pressed("ui_down"):
		motion.y = SPEED
	# Se não, o eixo Y da movimentação é 0.
	else:
		motion.y = 0
	
	# Movimenta jogador.
	move_and_slide(motion)