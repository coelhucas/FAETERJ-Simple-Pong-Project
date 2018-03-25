extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

# (SIGNAL) Se o botão de 1 jogador for clicado:
func play_one_player():
	# Manda para o script global o modo de jogo de 1 jogador, avisando que o player 2 é o cpu.
	get_node("/root/Globals").game_mode = "cpu"
	
	get_tree().change_scene("res://Main.tscn")

# (SIGNAL) Se o botão de 2 jogadores for clicado:
func player02_selected():
	# Manda para o script global o modo de jogo de 2 jogadores, avisando que o player 2 é uma pessoa.
	get_node("/root/Globals").game_mode = "human"
	
	get_tree().change_scene("res://Main.tscn")
