require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis" 
require "yaml"

set :port, 8080

before do
  @users = YAML.load_file("users.yaml")
  @title = "Users & Interests"
  @all_interests = count_interests
  
end

get "/" do
  erb :names
end

get "/home" do
  redirect "/"
end

get "/user/:name" do
  name = params[:name].to_s
  @user = [name, @users[name.to_sym]]
  @info = @user[1]
  
  erb :user
end

helpers do
  def count_interests
    count = []
    @users.each{ |usr| count.push(usr[1][:interests]) }
    count.flatten.length
  end
end