extends Node

var player_button_dict = {
	"1": [ false, false, false, false ],
	"2": [ false, false, false, false ]
}

var active_unit_button = [0, 0]

var player_turn = 1

var TOP_LEFT_GRID = [ 415, 224 ]
var OFFSET = 64

func get_tile_position(row, col):
	var x = TOP_LEFT_GRID[0] + ((col-1) * OFFSET)
	var y = TOP_LEFT_GRID[1] + ((row-1) * OFFSET)
	return [x, y]
	
func change_player_turn():
	if player_turn == 1:
		player_turn = 2
	else:
		player_turn = 1
