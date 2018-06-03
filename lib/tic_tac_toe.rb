WIN_COMBINATIONS = [[0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8],
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8],
                    [0, 4, 8],
                    [6, 4, 2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  player = "X"

  if valid_move?(board,index)
    puts "valid move"
    move(board, index, player)
    display_board(board)
   else
    puts "try again"
    turn(board)
  end
end

def turn_count(board)
counter = 0
board.each do |occupied_positions|
 if occupied_positions == "X" || occupied_positions == "O"
      counter +=1
   end
 end
 return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
   current_player = "X"
  else
   current_player = "O"
  end
  return current_player
 end

