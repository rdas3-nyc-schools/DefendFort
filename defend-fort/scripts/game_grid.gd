extends TileMapLayer

var ranged_unit_single = load("res://scenes/units/single_unit.tscn")
@onready var player1_unit_node = $"../Player1/Units"
@onready var player2_unit_node = $"../Player2/Units"




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func is_in_grid(row, col) -> bool:
	if row >= 1 and row <= 4:
		if col >= 1 and col <= 6:
			return true
	return false

func _input(event):
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_local_mouse_position()
		var grid_coord = local_to_map(mouse_pos)
		var grid_row = grid_coord[1] - 2
		var grid_col = grid_coord[0] - 5
		if is_in_grid(grid_row, grid_col) and GameState.active_unit_button[0] != 0 and GameState.active_unit_button[0] == GameState.player_turn:
			var unit_instance = ranged_unit_single.instantiate()
			var unit_position = GameState.get_tile_position(grid_row, grid_col)
			unit_instance.position = Vector2(unit_position[0], unit_position[1])
			var unit_type = GameState.active_unit_button[1]
			if unit_type % 2 == 0:
				unit_instance.get_child(0).texture = load("res://assets/unit_images/melee_unit_single.png")
			player1_unit_node.add_child(unit_instance)
			GameState.active_unit_button = [0, 0]
			GameState.change_player_turn()
