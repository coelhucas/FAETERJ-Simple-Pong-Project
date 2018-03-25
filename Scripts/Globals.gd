# Globals.gd
extends Node
"""
Esse script serve para definirmos valores globais. Para ele funcionar, devemos ir a aba
Project -> Project Settings -> AutoLoad e adicionarmos ele a lista. Funciona como um Singleton.
Usarei esse script para passar ao jogo se escolhemos o modo single ou multi-player.
"""

var game_mode = "cpu"