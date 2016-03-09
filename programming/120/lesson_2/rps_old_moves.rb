class Move
  VALUES = %w(rock paper scissors).freeze
  
  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    rock? && other_move.scissors? ||
      paper? && other_move.rock? ||
      scissors? && other_move.paper?
  end

  def <(other_move)
    rock? && other_move.paper? ||
      paper? && other_move.scissors? ||
      scissors? && other_move.rock?
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    set_score
  end

  def set_score
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = ""
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['GlaDOS', 'R2D2', 'Hal'].sample
  end

  def choose
    first = (Move::VALUES).dup.keep_if{ |value| value != (computer_losing_play) }
    self.move = Move.new(first.sample)
  end
  
  def computer_losing_play
    losses = RPSGame::old_moves.select{ |round| round["winner"] = human.name }

    r = 0
    p = 0
    s = 0

    losses.each do |round|
      if round[comupter.name] = 'rock'
        r += 1
      elsif round[computer.name] = 'paper'
        p += 1
      elsif round[computer.name] = 'scissors'
        s += 1
      end
    end
    [r, p, s].sort.first
  end
  
end

class RPSGame
  attr_accessor :human, :computer, :old_moves

  def initialize
    @human = Human.new
    @computer = Computer.new
    @old_moves = []
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors! Win 10 rounds against the computer to win the whole game."
  end

  def display_goodbye
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end 

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end
  
  def game_winner
    if human.move > computer.move
      return human.name
    elsif human.move < computer.move
      return computer.name
    else
      return "tie"
    end
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def keep_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
    puts "The score is #{human.name}: #{human.score}, #{computer.name}: #{computer.score}"
    puts "#{computer.name} won 10 rounds!" if computer.score == 1
    puts "#{human.name} won 10 rounds!" if human.score == 1
  end

  def win?
    human.score == 1 || computer.score == 1
  end

  def play_again?
    answer = nil
    loop do
      puts "Would #{human.name} like to play another round? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return true if ['Y', 'y'].include?answer
    return false
  end

  def new_game?
    answer = nil
    loop do
      puts "Would #{human.name} like to play a new game? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Please choose 'y' or 'n'."
    end
    human.set_score
    computer.set_score
    return true if ['Y', 'y'].include?(answer)
    return false
  end

  def store_moves
    game = {}
    game[human.name] = "#{human.move}"
    game[computer.name] = "#{computer.move}"
    game[computer.winner] = game_winner
    old_moves.push(game)
    puts old_moves
  end
  
  def show_moves
    puts "Would you like to see the previous moves? (y/n)"
    reply = gets.chomp
    if reply.start_with?('Y', 'y')
      puts "Here are the previous moves:"
      old_moves.each do |round|
        puts "Round #{old_moves.index(round) + 1}: "
        round.each do |player, move|
          puts "     #{player} => #{move}"
        end
      end
    end
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        store_moves
        display_moves
        display_winner
        keep_score
        break if win?
        break unless play_again?
      end
      show_moves
      break unless new_game?
    end
    display_goodbye
  end
end

RPSGame.new.play
