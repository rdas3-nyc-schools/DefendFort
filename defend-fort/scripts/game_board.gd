extends Node2D

@onready var game_grid: TileMapLayer = $GameGrid
# quick nodes
@onready var PLAYER1_HEALTH_BAR = $Player1/Player1HealthBar
@onready var PLAYER2_HEALTH_BAR = $Player2/Player2HealthBar

@onready var PLAYER1_MELEE_UNIT1 = $Player1/UnitButtons/MeleeUnit1
@onready var PLAYER1_RANGED_UNIT1 = $Player1/UnitButtons/RangedUnit1
@onready var PLAYER1_MELEE_UNIT2 = $Player1/UnitButtons/MeleeUnit2
@onready var PLAYER1_RANGED_UNIT2 = $Player1/UnitButtons/RangedUnit2

@onready var PLAYER2_MELEE_UNIT1 = $Player2/UnitButtons/MeleeUnit1
@onready var PLAYER2_RANGED_UNIT1 = $Player2/UnitButtons/RangedUnit1
@onready var PLAYER2_MELEE_UNIT2 = $Player2/UnitButtons/MeleeUnit2
@onready var PLAYER2_RANGED_UNIT2 = $Player2/UnitButtons/RangedUnit2

@onready var PLAYER1_HERO1_BUTTON = $Player1/Spells/Player1Hero1SpellButton
@onready var PLAYER1_HERO2_BUTTON = $Player1/Spells/Player1Hero2SpellButton
@onready var PLAYER2_HERO1_BUTTON = $Player2/Spells/Player2Hero1SpellButton
@onready var PLAYER2_HERO2_BUTTON = $Player2/Spells/Player2Hero2SpellButton

@onready var PLAYER_TURN_LABEL = $PlayerTurnLabel

@onready var SPELL_SCENE = $SpellInterface

func reset_button_state():
	GameState.player_button_dict = { "1": [ false, false, false, false ], "2": [ false, false, false, false ] }

func set_positions():
	# set up health bar positions
	PLAYER1_HEALTH_BAR.position = Vector2(606, 457)
	PLAYER2_HEALTH_BAR.position = Vector2(606, 154)
	
	# set up player 1 unit positions
	PLAYER1_MELEE_UNIT1.position = Vector2(155, 519)
	PLAYER1_RANGED_UNIT1.position = Vector2(155, 597)
	
	PLAYER1_MELEE_UNIT2.position = Vector2(994, 519)
	PLAYER1_RANGED_UNIT2.position = Vector2(994, 597)
	
	PLAYER2_MELEE_UNIT1.position = Vector2(155,45)
	PLAYER2_RANGED_UNIT1.position = Vector2(155,127)
	
	PLAYER2_MELEE_UNIT2.position = Vector2(994,45)
	PLAYER2_RANGED_UNIT2.position = Vector2(994,127)
	
func _ready():
	
	set_positions()
	
	PLAYER1_HERO1_BUTTON.pressed.connect(_on_button_pressed.bind(PLAYER1_HERO1_BUTTON.name))
	PLAYER1_HERO2_BUTTON.pressed.connect(_on_button_pressed.bind(PLAYER1_HERO2_BUTTON.name))
	PLAYER2_HERO1_BUTTON.pressed.connect(_on_button_pressed.bind(PLAYER2_HERO1_BUTTON.name))
	PLAYER2_HERO2_BUTTON.pressed.connect(_on_button_pressed.bind(PLAYER2_HERO2_BUTTON.name))
	
func _input(event):
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if true in GameState.player_button_dict["1"]:
			GameState.active_unit_button = [1, GameState.player_button_dict["1"].find(true)]
		if true in GameState.player_button_dict["2"]:
			GameState.active_unit_button = [2, GameState.player_button_dict["2"].find(true)]
	
func _process(_delta):
	PLAYER1_HEALTH_BAR.tooltip_text = "HP: " +  str(int(PLAYER1_HEALTH_BAR.value)) + " / " + str(int(PLAYER1_HEALTH_BAR.max_value))
	PLAYER2_HEALTH_BAR.tooltip_text = "HP: " +  str(int(PLAYER2_HEALTH_BAR.value)) + " / " + str(int(PLAYER2_HEALTH_BAR.max_value))
	
	PLAYER_TURN_LABEL.text = "Player " + str(GameState.player_turn) + " turn"
	
func _on_button_pressed(_button_name):
	SPELL_SCENE.visible = not SPELL_SCENE.visible

func set_button_state(player, index):
	GameState.player_button_dict[player][index] = true

func _on_melee_unit_1_mouse_entered() -> void:
	reset_button_state()
	set_button_state("1", 0)
func _on_melee_unit_1_mouse_exited() -> void:
	reset_button_state()
func _on_ranged_unit_1_mouse_entered() -> void:
	reset_button_state()
	set_button_state("1", 1)
func _on_ranged_unit_1_mouse_exited() -> void:
	reset_button_state()
func _on_melee_unit_2_mouse_entered() -> void:
	reset_button_state()
	set_button_state("1", 2)
func _on_melee_unit_2_mouse_exited() -> void:
	reset_button_state()
func _on_ranged_unit_2_mouse_entered() -> void:
	reset_button_state()
	set_button_state("1", 3)
func _on_ranged_unit_2_mouse_exited() -> void:
	reset_button_state()
func _on_player2_melee_unit_1_mouse_entered() -> void:
	reset_button_state()
	set_button_state("2", 0)
func _on_player2_melee_unit_1_mouse_exited() -> void:
	reset_button_state()
func _on_player2_ranged_unit_1_mouse_entered() -> void:
	reset_button_state()
	set_button_state("2", 1)
func _on_player2_ranged_unit_1_mouse_exited() -> void:
	reset_button_state()
func _on_player2_melee_unit_2_mouse_entered() -> void:
	reset_button_state()
	set_button_state("2", 2)
func _on_player2_melee_unit_2_mouse_exited() -> void:
	reset_button_state()
func _on_player2_ranged_unit_2_mouse_entered() -> void:
	reset_button_state()
	set_button_state("2", 3)
func _on_player2_ranged_unit_2_mouse_exited() -> void:
	reset_button_state()
