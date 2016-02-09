require "sinatra"
#require "sinatra/reloader" if development?
require "pry" if development?
require "require_all"
require_relative './lib/Calculator'


get "/" do
  erb(:server)
end


post "/calculate" do
  @first = params[:first_number].to_f
  @second = params[:second_number].to_f
  @oper = params[:operation]
  case @oper
  when "sum"
    @resultado = Calculator.sum(@first, @second)
  when "sub"
    @resultado = Calculator.sub(@first, @second)
  when "mul"
    @resultado = Calculator.mul(@first, @second)
  when "div"
    @resultado = Calculator.div(@first, @second)
  else
    @resultado = -1
  end
  redirect to("/calculate_cont/#{@resultado.to_i}")
end


get "/calculate_cont/:value" do
  # CHARGE THEM THAT MONEY
  @recieved_num = params[:value]
  erb(:calculate_again)
end

# get "/add" do
#   erb(:add)
# end

# post "/calculate_add" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   result = first + second
#   "#{first} + #{second} = #{result}"
# end

post "/charge_money" do
  # CHARGE THEM THAT MONEY

  redirect to("/payment_success")
end