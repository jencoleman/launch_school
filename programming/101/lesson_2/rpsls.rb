# rock, paper, scissors, lizard, spock game

def prompt(string)
  puts "=> #{string}"
end

def win?(first, second)
  (first == "scissors" && second == "paper") ||
    (first == "paper" && second == "rock") ||
    (first == "rock" && second == "lizard") ||
    (first == "lizard" && second == "paper") ||
    (first == "paper" && second == "spock") ||
    (first == "spock" && second == "rock") ||
    (first == "rock" && second == "scissors") ||
    (first == "lizard" && second == "spock") ||
    (first == "spock" && second == "scissors") ||
    (first == "scissors" && second == "lizard")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round")
  elsif win?(computer, player)
    prompt("Computer won this round")
  else
    prompt("Its a tie.")
  end
end

def options(string)
  case string
  when "r"
    "rock"
  when "p"
    "paper"
  when "s"
    "scissors"
  when "l"
    "lizard"
  end
end

VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

prompt("Welcome to rock, paper, scissors, lizard, spock game. Win 5 rounds against the computer to win the game!")

loop do
  prompt("Choose one by typing the word or first letter (Except Spock, which must be completely spelled out): #{VALID_CHOICES.join(', ')}")
  my_score = 0
  computer_score = 0

  loop do
    prompt("Please make your choice now:")
    my_choice = ''

    loop do
      input = gets.chomp.downcase
      my_choice = options(input)
      break if VALID_CHOICES.include?(my_choice)
      prompt("That's not a valid choice.")
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{my_choice} and computer chose #{computer_choice}.")

    display_results(my_choice, computer_choice)

    if win?(my_choice, computer_choice)
      my_score += 1
    elsif win?(computer_choice, my_choice)
      computer_score += 1
    end

    if my_score == 5
      prompt("and you win the whole game!")
      break
    elsif computer_score == 5
      prompt("and the computer wins the whole game.")
      break
    end

    prompt("Do you want to play another round?")
    reply = gets.chomp
    break unless reply.start_with?('y', 'Y')
  end

  prompt("The final score is: You - #{my_score}, Computer - #{computer_score}. Do you want to play a new game?")
  reply = gets.chomp
  break unless reply.start_with?('y', 'Y')
end
prompt("Goodbye!")
