require "sinatra"
require "sinatra/reloader" if development?
require "pry" if development?

enable(:sessions)

get "/" do
  "My first <strong>Sinatra app</strong>."
end

get "/hi" do
  "hello, world"
end

get "/pauabout" do
  "Hello, mi name is <strong>Pau</strong>"
end

get "/primera" do
  @greeting = "Hello, world ---> ehhhhhhhhh"
  erb(:author)
end

get "/pizza" do
  @ingredients = ["Jamon", "Bacon,", "Queso"]
  erb(:pizza)
end

get "/users/:username" do
  @username = params[:username]

  erb(:user_profile)
end

get "/suma/:value1/:value2" do
  @numero1 = params[:value1]
  @numero2 = params[:value2]
  @suma = @numero1.to_i + @numero2.to_i

  erb(:suma)
end

get "/hours/:antesodespues/:horas" do
  @antesodespues = params[:antesodespues]
  @numero = params[:horas]
  @numero = @numero.to_i
  @tiempo = Time.new
  #binding.pry
  if (@antesodespues == "ago")
    @tiempo = @tiempo - (3600 * @numero)
  elsif (@antesodespues == "before")
    @tiempo = @tiempo + (3600 * @numero)
  else 
    @tiempo
  end

  erb(:hora)
end


get "/foo" do
  status(418)
  "I'm a tea pot!"
end

get "/session_test" do
  session[:saved_value]
end

get "/session_test/:text" do
  text = params[:text]
  session[:saved_value] = text
end
