require "sinatra"
require "sinatra/reloader" if development?
require "pry" if development?
require "require_all"
require_relative './lib/passvalidator'


get "/" do
  erb(:server)
end


post "/senddata" do
  @email = params[:email]
  @password = params[:password]

  if PassValidator.long(@password) && PassValidator.string_downcase(@password) && PassValidator.string_upcase(@password) && PassValidator.string_number(@password) && PassValidator.string_spec_char(@password) && PassValidator.pass_cont_emailvalue(@email, @password)
    erb(:ok)
  else
  redirect to("/error/#{@email}")
end
end


get "/error/:value" do
  @email_recover = params[:value]
  erb(:error)
end

# get "/calculate_cont/:value" do
#   # CHARGE THEM THAT MONEY
#   @recieved_num = params[:value]
#   erb(:calculate_again)
# end

# get "/add" do
#   erb(:add)
# end

# post "/calculate_add" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   result = first + second
#   "#{first} + #{second} = #{result}"
# end

# post "/charge_money" do
#   # CHARGE THEM THAT MONEY

#   redirect to("/payment_success")
# end