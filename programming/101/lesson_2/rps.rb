# rock, paper, scissors game

def prompt(string)
  puts "=> #{string}"
end

def win?(first, second)
  (first == "scissors" && second == "rock") ||
  (first == "rock" && second == "paper") ||
  (first == "paper" && second == "scissors")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won.")
  else
    prompt("Its a tie.")
  end
end

prompt("Hello! Welcome to rock, paper, scissors game.")
choice = ''

VALID_CHOICES = %w(rock paper scissors)

loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")

  loop do
    choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice. Make a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice} and computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  reply = gets.chomp.downcase
  break unless reply.start_with?('y')
end

prompt("Goodbye!")
