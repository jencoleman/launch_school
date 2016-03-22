# Tic Tac Toe
require 'pry'

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

def joinor(array)
  if array.length > 1
    last_num = array.last.to_s
    new_array = array[0..(array.length - 2)]
    new_array.join(", ") + " or " + last_num
  elsif array.length == 1
    array[0].to_s
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))})")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("That is not a valid choice. Please choose a blank space.")
  end
  brd[square] = PLAYER_MARKER
end

def best_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select{ |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil

  # defense
  WINNING_LINES.each do |line|
    square = best_square(line, brd, PLAYER_MARKER)
    break if square
  end

  # offense
  if !square
    WINNING_LINES.each do |line|
      square = best_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # available 5
 # if !square && empty_squares(brd).include?(5)
 #   square = 5
 # end

  if !square
    square = empty_squares(brd).sample
  end

  return brd[square] = COMPUTER_MARKER
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
  prompt("This is the tic-tac-toe game. Mark 3 Xs in a row, horizontally or diagonally, to win one round against the computer. First to win 5 rounds wins the game. Enter the number that corresponds to the box you want to mark:
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

  player_score = 0
  computer_score = 0

  loop do
    board = initialize_board
    display_board(board)

    loop do
      computer_places_piece!(board)
      break if board_full?(board) || someone_won?(board)

      display_board(board)

      player_places_piece!(board)
      break if board_full?(board) || someone_won?(board)
    end

    if someone_won?(board)
      display_board(board)
      prompt("#{detect_winner?(board)} won this round!")
    else
      prompt("Its a tie!")
    end

    if detect_winner?(board) == 'Player'
      player_score += 1
    elsif detect_winner?(board) == 'Computer'
      computer_score += 1
    end

    if player_score == 5
      prompt("You win the 5-round game!")
      break
    elsif computer_score == 5
      prompt("Computer wins the 5-round game.")
      break
    end

    prompt("Play another round? (Y or N)")
    reply = gets.chomp
    break unless reply.start_with?('y', 'Y')
  end

  prompt("Play another game? (Y or N)")
  reply = gets.chomp
  break unless reply.start_with?('y', 'Y')
end
prompt("Goodbye! Thanks for playing.")
