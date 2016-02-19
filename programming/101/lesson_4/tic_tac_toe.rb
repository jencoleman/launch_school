# Tic Tac Toe

INITIAL_MARKER = " ".freeze
PLAYER_MARKER = "X".freeze
COMPUTER_MARKER = "O".freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 5, 9], [3, 5, 7], [1, 4, 7]] + # cols
                [[2, 5, 8], [3, 6, 9]] # diagonals

def prompt(string)
  puts "=> #{string}"
end
# rubocop disable Metrics/Method Length
def display_board(brd)
  system "clear"
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end
# rubocop enable Metrics/Method Length

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{empty_squares(brd).join(', ')}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("That is not a valid choice. Please choose a blank space.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner?(brd)
end

def detect_winner?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
       return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialize_board

  prompt("This is the tic-tac-toe game. Mark 3 Xs in a row, horizontally or diagonally, to win against the computer. To make your selection, enter the number that corresponds to the box you want to mark:
         |     |     
      1  |  2  |  3  
         |     |     
    -----+-----+-----
         |     |     
      4  |  5  |  6  
         |     |     
    -----+-----+-----
         |     |     
      7  |  8  |  9  
         |     |     ")

  loop do
    display_board(board)

    player_places_piece!(board)
    break if board_full?(board) || someone_won?(board)

    computer_places_piece!(board)
    break if board_full?(board) || someone_won?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner?(board)} won!")
  else
    prompt("Its a tie!")
  end
  prompt("Play again? (Y or N")
  reply = gets.chomp
  break unless reply.start_with?('y', 'Y')
end
prompt("Goodbye! Thanks for playing.")
