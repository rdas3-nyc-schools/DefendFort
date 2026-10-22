extends Node2D

@onready var game_grid: TileMapLayer = $GameGrid

func _ready():
	$Player1HealthBar.position = Vector2(606, 457)
	$Player2HealthBar.position = Vector2(606, 154)

func _input(event):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			var mouse_pos = get_local_mouse_position()
			var grid_coord = game_grid.local_to_map(mouse_pos)
			var grid_row = grid_coord[1] - 2
			var grid_col = grid_coord[0] - 5
			print("Clicked on row ", grid_row, " and column ", grid_col)
			$Player1HealthBar.value -= 1
