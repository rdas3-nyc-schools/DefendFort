extends Node2D

@onready var game_grid: TileMapLayer = $GameGrid
# quick nodes
@onready var player1_heath_bar = $Player1/Player1HealthBar
@onready var player2_heath_bar = $Player2/Player2HealthBar


func _ready():
	
	# set up health bar positions
	player1_heath_bar.position = Vector2(606, 457)
	player2_heath_bar.position = Vector2(606, 154)
	
func _process(delta):
	player1_heath_bar.tooltip_text = "HP: " +  str(int(player1_heath_bar.value)) + " / " + str(int(player1_heath_bar.max_value))
	player2_heath_bar.tooltip_text = "HP: " +  str(int(player2_heath_bar.value)) + " / " + str(int(player2_heath_bar.max_value))

func _input(event):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			var mouse_pos = get_local_mouse_position()
			var grid_coord = game_grid.local_to_map(mouse_pos)
			var grid_row = grid_coord[1] - 2
			var grid_col = grid_coord[0] - 5
