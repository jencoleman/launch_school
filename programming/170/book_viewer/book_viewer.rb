require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis" 

set :port, 8080

before do
  @contents = File.readlines "data/toc.txt"
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"
  
  @chapter = File.read "data/chp#{number}.txt"
  
  erb :chapters
end

get "/search" do
  if params[:query]
    @results = @contents.each_with_index do |_, index|
      text = File.read("data/chp#{index + 1}.txt")
      paragraph = text.split("\n\n")
      
      paragraph.any? do |ph|
        ph.include?(params[:query])
      end
    end
  end
  erb :search
end


error Sinatra::NotFound do 
  redirect "/"
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end
  
  def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end
end

  
