class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :name

  def initialize(marker)
    @marker = marker
    @name = nil
  end
end

class TTTGame

  attr_reader :board, :human, :computer, :human_score, :computer_score, :computer_marker, :human_marker
  
  def initialize
    @human_marker = nil
    display_welcome_message
    pick_marker
    @computer_marker = other_marker
    @board = Board.new
    @human = Player.new(@human_marker)
    @computer = Player.new(@computer_marker)
    @current_marker = human_marker
    @human_score = 0
    @computer_score = 0
  end

  def play
    set_names
    clear
    loop do
      loop do
        display_board

        loop do
          current_player_moves
          scoring
          break if board.someone_won? || board.full?
          clear_screen_and_display_board
        end

        display_result
        winner_notification
        break if someone_won_5?

        break unless play_another_round?
        reset
        display_play_again_message
      end
      break unless play_another_game?
    end

    display_goodbye_message
  end

  private

  def set_names
    computer.name = %w(Hal GlaDOS Wheatley).sample
    first = ''
    puts "What is your name?"
    loop do
      first = gets.chomp
      break unless first.empty?
      puts "Please enter a name."
    end
    human.name = first
  end

  def pick_marker
    answer = nil
    loop do
      puts "Please choose your game piece: type X or O"
      answer = gets.chomp.upcase
      break if %w(X O).include? answer
      puts "That's an invalid choice."
    end
    @human_marker = answer
  end

  def other_marker
    return "X" if @human_marker != "X"
    return "O" if @human_marker != "O"
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe! Win 5 rounds to win the whole game."
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def winner_notification
    puts "#{human.name} wins the 5-round game!" if human_score == 5
    puts "#{computer.name} wins the 5-round game." if computer_score == 5
  end

  def display_board
    puts "#{human.name} is #{human.marker}. #{computer.name} is #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def joinor(array, punctuation = ', ', word = 'or')
    array[array.length - 1] = "#{word} #{array[array.length - 1]}" if array.length > 1
    array.join(punctuation)
  end

  def human_moves
    puts "Choose a square: #{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if @current_marker == human.marker
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won the round!"
    when computer.marker
      puts "#{computer.name} won the round!"
    else
      puts "It's a tie!"
    end
  end

  def scoring
    case
    when board.winning_marker == human.marker
      @human_score += 1
    when board.winning_marker == computer.marker
      @computer_score += 1
    end
  end

  def someone_won_5?
    human_score == 5 || computer_score == 5
  end

  def play_another_round?
    answer = nil
    loop do
      puts "Would you like to play another round? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def play_another_game?
    answer = nil
    loop do
      puts "Would #{human.name} like to start a new game? (y/n)"
      answer = gets.chomp
      break if %w(y n).include? answer
      puts "Sorry, that is not a valid reply."
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = human.marker
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
