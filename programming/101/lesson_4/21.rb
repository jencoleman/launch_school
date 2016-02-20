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
  player[card] = deck[card]
  deck.delete(card)
end

def create_hand(deck, player)
  draw_card(deck, player)
  draw_card(deck, player)
  return player
end

def display_hands(dealer_hand, player_hand)
  puts ""
  system "clear"
  puts "---------------------------"
  puts "Dealer Cards"
  puts ""
  puts "     " + dealer_hand.keys.first
  puts "     " + "Hidden Dealer Card"
  puts "---------------------------"
  puts "Player Cards"
  puts ""
  player_hand.each{ |k, _| puts "     " + k }
  puts "---------------------------"
end

# Welcome user
prompt("Hello! Welcome to the 21 Game.")


  prompt("Dealer shuffles deck...")
  french_deck = initialize_deck
  sleep 2
  
    dealer_hand = {}
    player_hand = {}

    create_hand(french_deck, dealer_hand)
    create_hand(french_deck, player_hand)
    
    display_hands(dealer_hand, player_hand)
    
    
