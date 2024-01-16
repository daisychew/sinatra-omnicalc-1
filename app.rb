require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @input_num = params.fetch("users_number")
  @result_num = params.fetch("users_number").to_f ** 2

  erb(:squared)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @input_num = params.fetch("users_number")
  @result_num = Math.sqrt(params.fetch("users_number").to_f)  

  erb(:square_rooted)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_f
  @principal = params.fetch("principal").to_f

  @apr_monthly = @apr/12/100
  @years_monthly = @years/12
  @numerator = @principal * @apr_monthly
  @denominator = 1 - (1 + @apr_monthly) ** (-@years_monthly)
  @payment = (@numerator/@denominator/100).round(4).to_s

  erb(:payment_results)
end
