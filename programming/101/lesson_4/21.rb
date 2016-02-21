# 21 Game

def prompt(string)
  puts "=> #{string}"
end

def initialize_deck
  deck_52 = {}
  cards = {"Ace" => 1}
  numbered = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]
  face = ["Jack", "Queen", "King"]
  suit =  ["Diamonds", "Hearts", "Clubs", "Spades"]
  
  numbered.each { |num| cards[num] = num.to_i }
  face.each { |f| cards[f] = 10 }
  cards.each do |k, v|
    suit.each{ |name| deck_52[k + " of " + name] = v }
  end
  return deck_52
end

def draw_card(deck, player)
  card = deck.keys.sample
  player.store(card, deck[card])
  deck.delete(card)
end

def create_hand(deck, player)
  draw_card(deck, player)
  draw_card(deck, player)
  return player
end

def busted?(player)
  player.values.inject(0, :+) > 21
end

def auto_win?(player)
  player.values.inject(0, :+) == 21
end

def player_turn(deck, dealer, player)
  player_action = ""
  loop do
    loop do
      prompt("Please press 1 for hit, or 2 for stay.")
      player_action = gets.chomp
      break if player_action == "1" || player_action == "2"
    end
    if player_action == "1"
      draw_card(deck, player)
      display_hands(dealer, player)
    elsif player_action == "2"
      break
    end

    display_hands(dealer, player)
    if busted?(player)
     prompt("You lose!")
    elsif auto_win?(player)
     prompt("That's 21!")
    end
  end
end

def dealer_turn(deck, dealer, player)
  display_two_hands(dealer, player)
  prompt("Now its the dealer's turn.")
  sleep 1
    if dealer.values.inject(0, :+) < 17
      prompt("Dealer hits....")
      draw_card(deck, dealer)
      display_two_hands(dealer, player)
      sleep 1
    end

  display_two_hands(dealer, player)
  if busted?(dealer)
    prompt("Dealer loses. You win!")
  elsif auto_win?(dealer)
    prompt("Dealer has 21. You lose.")
  end
end

def display_hands(dealer, player)
  puts ""
  system "clear"
  puts "---------------------------"
  puts "Dealer Cards"
  puts ""
  puts "     " + dealer.keys.first
  puts "     " + "Hidden Dealer Card"
  puts "---------------------------"
  puts "Player Cards"
  puts ""
  player.each{ |k, _| puts "     " + k }
  puts "---------------------------"
end

def display_two_hands(dealer, player)
  puts ""
  system "clear"
  puts "---------------------------"
  puts "Dealer Cards"
  puts ""
  dealer.each{ |k, _| puts "     " + k }
  puts "---------------------------"
  puts "Player Cards"
  puts ""
  player.each{ |k, _| puts "     " + k }
  puts "---------------------------"
end

# Welcome user
prompt("Hello! Welcome to the 21 Game.")
  prompt("Dealer shuffles deck...")
  french_deck = initialize_deck
  sleep 1
  
  loop do
    dealer_hand = {}
    player_hand = {}
    winner = nil
    
    create_hand(french_deck, dealer_hand)
    create_hand(french_deck, player_hand)
    display_hands(dealer_hand, player_hand)
    
    player_turn(french_deck, dealer_hand, player_hand)
    dealer_turn(french_deck, dealer_hand, player_hand)
    if dealer_hand.values.inject(0, :+) < player_hand.values.inject(0, :+)
      victor = "Player"
    elsif dealer_hand.values.inject(0, :+) > player_hand.values.inject(0, :+)
      victor = "Dealer"
    else
      prompt("Its a push.")
    end
    
    prompt("Play another hand?")
    reply = gets.chomp
    break unless reply.start_with?("Y", "y")
  end
