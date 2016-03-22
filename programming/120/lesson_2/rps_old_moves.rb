require 'singleton'

class History
  include Singleton

  attr_accessor :value

  def initialize
    @value = []
  end
end
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
  include Singleton
  
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
  include Singleton
  
  def set_name
    self.name = ['GlaDOS', 'R2D2', 'Hal'].sample
  end

  def choose
    second =  Move::VALUES.dup
    subset = second.keep_if{ |value| value != computer_losing_play() }
    self.move = Move.new(subset.sample)
  end

  def computer_losing_play
    losses = History.instance.value.select{ |round| round["Winner"] = Human.instance.name }

    r = 0
    h = 0
    s = 0

    losses.each do |round|
      if round["Computer"] = 'rock'
        r += 1
      elsif round["Computer"] = 'paper'
        h += 1
      elsif round["Computer"] = 'scissors'
        s += 1
      end
    end
    loser = [r, h, s].sort.last
    if loser = r
      return "rock"
    elsif loser = h
      return "paper"
    elsif loser = s
      return "scissors"
    end
    
  end
end

class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.instance
    @computer = Computer.instance
    @history = History.instance
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
    game["Computer"] = "#{computer.move}"
    game["Winner"] = game_winner
    history.value.push(game)
  end
  
  def show_moves
    puts "Would you like to see the previous moves? (y/n)"
    reply = gets.chomp
    if reply.start_with?('Y', 'y')
      puts "Here are the previous moves:"
      history.value.each do |round|
        puts "Round #{history.value.index(round) + 1}: "
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
