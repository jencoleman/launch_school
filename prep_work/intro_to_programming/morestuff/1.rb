words = ['laboratory', 'experiement', 'Pans Labyrinth', 'elaborate', 'polar bear']

words.each do |word|
  if word.downcase =~ /lab/
    puts word
  end
end

