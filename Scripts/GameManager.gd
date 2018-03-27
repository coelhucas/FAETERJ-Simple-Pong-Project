extends Node2D
# Pontuação dos jogadores
var player01_score = 0 
var player02_score = 0

# Estados do jogo, para saber se tem 1 ou 2 players.
var state = GAME_STATE.two_players
enum GAME_STATE {
	two_players,
	one_player
	}
func _ready():
	# Passa para o jogo o que foi escolhido no menu inicial.
	if get_node("/root/Globals").game_mode == "cpu":
		state = GAME_STATE.one_player
	else:
		state = GAME_STATE.two_players
	""" Se o estado for 2 jogadores, declara o modo do Player 2 como human.
	Se não, declara o modo do Player 2 como CPU."""
	if state == GAME_STATE.two_players:
		$Player02.mode = "human"
	else:
		$Player02.mode = "cpu"
	
	# Delay inicial para o jogador ter um tempo antes do jogo começar.
	$Ball/Delay.start()
	$FakeBall/Delay.start()
# Adiciona pontuação ao player 2 caso a bola entre na área de pontuação.
func add_player2_score(body):
	if body.is_in_group("ball"):
		player02_score += 1
		update_gui()

# Adiciona pontuação ao player 1 caso a bola entre na área de pontuação.
func add_player01_score(body):
	if body.is_in_group("ball"):
		player01_score += 1
		update_gui()

# Atualiza na UI as informações de pontuação
func update_gui():
	$Ball/SFX.stream = $Ball.lose_sfx
	$Ball/SFX.play()
	$GUI/Player01Score.text = str(player01_score)
	$GUI/Player02Score.text = str(player02_score)
	# Reseta a posição das bolas
	_reset_ball()

# Reseta as posições da bola e aciona o delay para recomeçar
func _reset_ball():
	$Ball.set_global_position($Ball.start_pos)
	$FakeBall.set_global_position($Ball.get_global_position())
	$Ball.motion = Vector2($Ball.speed, $Ball.speed)
	$FakeBall.motion = Vector2($Ball.speed - 2, $Ball.speed - 2)
	$Ball/Delay.start()
	$FakeBall/Delay.start()
